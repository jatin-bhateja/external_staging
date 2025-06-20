
import jdk.incubator.vector.FloatVector;
import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorShuffle;
import jdk.incubator.vector.VectorSpecies;

import java.lang.foreign.MemorySegment;
import java.nio.ByteOrder;

public class CosineSimilarityTest {

    static final boolean HAS_AVX512 = IntVector.SPECIES_PREFERRED == IntVector.SPECIES_512;
    static final boolean HAS_AVX2 = IntVector.SPECIES_PREFERRED == IntVector.SPECIES_256;
    static final boolean HAS_AVX = IntVector.SPECIES_PREFERRED == IntVector.SPECIES_128;

    public static final VectorSpecies<Float> F512 = FloatVector.SPECIES_512;
    public static final VectorSpecies<Float> F256 = FloatVector.SPECIES_256;
    public static final VectorSpecies<Float> F128 = FloatVector.SPECIES_128;

    public static final VectorShuffle<Float> f512_upper_lane8To16 = VectorShuffle.iota(F512, 8, 1, true);
    public static final VectorShuffle<Float> f512_upper_lane4To8 = VectorShuffle.iota(F512, 4, 1, true);
    public static final VectorShuffle<Float> f512_upper_lane2To4 = VectorShuffle.iota(F512, 2, 1, true);
    public static final VectorShuffle<Float> f512_upper_lane1To2 = VectorShuffle.iota(F512, 1, 1, true);

    public static final VectorShuffle<Float> f256_upper_lane4To8 = VectorShuffle.iota(F256, 4, 1, true);
    public static final VectorShuffle<Float> f256_upper_lane2To4 = VectorShuffle.iota(F256, 2, 1, true);
    public static final VectorShuffle<Float> f256_upper_lane1To2 = VectorShuffle.iota(F256, 1, 1, true);

    public static final VectorShuffle<Float> f128_upper_lane2To4 = VectorShuffle.iota(F128, 2, 1, true);
    public static final VectorShuffle<Float> f128_upper_lane1To2 = VectorShuffle.iota(F128, 1, 1, true);

    public static float vectorSummationPreferred(FloatVector floatVector) {
        if (HAS_AVX512) {
            var vec1 = floatVector.add(floatVector.rearrange(f512_upper_lane8To16));
            var vec2 = vec1.add(vec1.rearrange(f512_upper_lane4To8));
            var vec3 = vec2.add(vec2.rearrange(f512_upper_lane2To4));
            return vec3.add(vec3.rearrange(f512_upper_lane1To2)).lane(0);
        }
        else if (HAS_AVX2) {
            var vec1 = floatVector.add(floatVector.rearrange(f256_upper_lane4To8));
            var vec2 = vec1.add(vec1.rearrange(f256_upper_lane2To4));
            return vec2.add(vec2.rearrange(f256_upper_lane1To2)).lane(0);

        }
        else if (HAS_AVX) {
            var vec1 = floatVector.add(floatVector.rearrange(f128_upper_lane2To4));
            return vec1.add(vec1.rearrange(f128_upper_lane1To2)).lane(0);
        }
        else {
            return floatVector.reduceLanes(VectorOperators.ADD);
        }
    }

    public static float cosineSimilarityBaseBenchmark(int dimension, MemorySegment arrayMS1, MemorySegment arrayMS2)
    {

        final int vectorizedLength = FloatVector.SPECIES_PREFERRED.loopBound(dimension);
        var vsum = FloatVector.zero(FloatVector.SPECIES_PREFERRED);
        var vaMagnitude = FloatVector.zero(FloatVector.SPECIES_PREFERRED);
        var vbMagnitude = FloatVector.zero(FloatVector.SPECIES_PREFERRED);

        int i = 0;
        // Process the vectorized part
        for (; i < vectorizedLength; i += FloatVector.SPECIES_PREFERRED.length()) {
            FloatVector a = FloatVector.fromMemorySegment(FloatVector.SPECIES_PREFERRED, arrayMS1, i, ByteOrder.LITTLE_ENDIAN);
            FloatVector b = FloatVector.fromMemorySegment(FloatVector.SPECIES_PREFERRED, arrayMS2, i, ByteOrder.LITTLE_ENDIAN);
            vsum = vsum.add(a.mul(b));
            vaMagnitude = a.fma(a, vaMagnitude);
            vbMagnitude = b.fma(b, vbMagnitude);
        }

        float sum = vsum.reduceLanes(VectorOperators.ADD);
        float aMagnitude = vaMagnitude.reduceLanes(VectorOperators.ADD);
        float bMagnitude = vbMagnitude.reduceLanes(VectorOperators.ADD);

        // Process the tail
        for (; i < dimension; ++i) {
            sum += ((float[]) arrayMS1.heapBase().get())[i] * ((float[]) arrayMS2.heapBase().get())[i];
            aMagnitude += ((float[]) arrayMS1.heapBase().get())[i] * ((float[]) arrayMS1.heapBase().get())[i];
            bMagnitude += ((float[]) arrayMS2.heapBase().get())[i] * ((float[]) arrayMS2.heapBase().get())[i];
        }

        return (float) (sum / Math.sqrt(aMagnitude * bMagnitude));
    }

    public static float cosineSimilarityOptBenchmark(int dimension, MemorySegment arrayMS1, MemorySegment arrayMS2)
    {

        final int vectorizedLength = FloatVector.SPECIES_PREFERRED.loopBound(dimension);
        var vsum = FloatVector.zero(FloatVector.SPECIES_PREFERRED);
        var vaMagnitude = FloatVector.zero(FloatVector.SPECIES_PREFERRED);
        var vbMagnitude = FloatVector.zero(FloatVector.SPECIES_PREFERRED);

        int i = 0;
        // Process the vectorized part
        for (; i < vectorizedLength; i += FloatVector.SPECIES_PREFERRED.length()) {
            FloatVector a = FloatVector.fromMemorySegment(FloatVector.SPECIES_PREFERRED, arrayMS1, i, ByteOrder.LITTLE_ENDIAN);
            FloatVector b = FloatVector.fromMemorySegment(FloatVector.SPECIES_PREFERRED, arrayMS2, i, ByteOrder.LITTLE_ENDIAN);
            vsum = vsum.add(a.mul(b));
            vaMagnitude = a.fma(a, vaMagnitude);
            vbMagnitude = b.fma(b, vbMagnitude);
        }

        float sum = vectorSummationPreferred(vsum);
        float aMagnitude = vectorSummationPreferred(vaMagnitude);
        float bMagnitude = vectorSummationPreferred(vbMagnitude);

        // Process the tail
        for (; i < dimension; ++i) {
            sum += ((float[]) arrayMS1.heapBase().get())[i] * ((float[]) arrayMS2.heapBase().get())[i];
            aMagnitude += ((float[]) arrayMS1.heapBase().get())[i] * ((float[]) arrayMS1.heapBase().get())[i];
            bMagnitude += ((float[]) arrayMS2.heapBase().get())[i] * ((float[]) arrayMS2.heapBase().get())[i];
        }

        return (float) (sum / Math.sqrt(aMagnitude * bMagnitude));
    }

    public static void main (String [] args) {
        int algo = Integer.parseInt(args[0]);
        float res = 0.0f;
        int dimension = 1536;
        float[] array1 = new float[dimension];
        float[] array2 = new float[dimension];
        for (int i = 0; i < dimension; i++) {
            array1[i] = (float) i + 1.0f;
            array2[i] = (float) i + 1.0f;
        }
        MemorySegment arrayMS1 = MemorySegment.ofArray(array1);
        MemorySegment arrayMS2 = MemorySegment.ofArray(array2);
        if (algo == 0) {
            for (int i = 0; i < 5000000; i++) {
                res += cosineSimilarityBaseBenchmark(dimension, arrayMS1, arrayMS2);
            }
	    System.out.println("Start now");
            long t1 = System.currentTimeMillis();
            for (long i = 0; i < 1000000; i++) {
                res += cosineSimilarityBaseBenchmark(dimension, arrayMS1, arrayMS2);
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
        } else if (algo == 1) {
            res = 0;
            for (int i = 0; i < 5000000; i++) {
                res += cosineSimilarityOptBenchmark(dimension, arrayMS1, arrayMS2);
            }
	    System.out.println("Start now");
            long t1 = System.currentTimeMillis();
            for (long i = 0; i < 1000000; i++) {
                res += cosineSimilarityOptBenchmark(dimension, arrayMS1, arrayMS2);
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
        }
    }

}


