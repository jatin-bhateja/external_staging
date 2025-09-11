import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test_vector_api {
    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    public static void kernel(float [] dst, float [] src1, float [] src2, float [] src3) {
        int i = 0;
        for (; i < FSP.loopBound(dst.length); i += FSP.length()) {
            FloatVector.fromArray(FSP, src1, i)
                       .lanewise(VectorOperators.FMA, FloatVector.fromArray(FSP, src2, i),
                                                      FloatVector.fromArray(FSP, src3, i))
                       .intoArray(dst, i);
        }
        for (; i < dst.length; i++) {
            dst[i] = Math.fma(src1[i], src2[i], src3[i]);
        }
    }

    public static void main(String [] args) {
        float [] dst = new float[2048];
        float [] src1 = new float[2048];
        float [] src2 = new float[2048];
        float [] src3 = new float[2048];
        IntStream.range(0, src1.length).forEach(i -> {src1[i] = (float)0.01 * i;});
        IntStream.range(0, src2.length).forEach(i -> {src2[i] = (float)0.03 * i;});
        IntStream.range(0, src3.length).forEach(i -> {src3[i] = (float)0.05 * i;});
        for (int i = 0; i < 10000; i++) {
            kernel(dst, src1, src2, src3);
        }
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
            kernel(dst, src1, src2, src3);
        }
        long end = System.currentTimeMillis();
        System.out.println("[time] " + (end - start) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 15)));
    }
}
