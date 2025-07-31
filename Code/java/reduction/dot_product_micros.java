
import java.util.stream.IntStream;
import java.util.Arrays;
import jdk.incubator.vector.*;

public class dot_product_micros {
    public static final int SIZE = 4095;
    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;


    public static float dot_product(float [] src1, float [] src2) {
        float res = 0.0f;
        for (int i = 0; i < SIZE; i++) {
            // cross iteration RAW dependency on 'res' makes the
            // loop non-vectorizable.
            res = Math.fma(src1[i], src2[i], res);
        }
        return res; 
    } 

    public static float dot_product_work_array(float [] src1, float [] src2) {
        float res = 0.0f;
        float [] temp = new float[SIZE];
        // remove cross iteration RAW dependency on 'res' by introducing a
        // temporary work array.
        for (int i = 0; i < SIZE; i++) {
            temp[i] = Math.fma(src1[i], src2[i], temp[i]);
        }
        for (int i = 0; i < SIZE; i++) {
            // cross iteration RAW dependency on 'res' makes the
            // loop non-vectorizable.
            res += temp[i];
        }
        return res; 
    } 

    static float [] temp = new float[SIZE];
    public static float dot_product_work_array_rem_alloc(float [] src1, float [] src2) {
        float res = 0.0f;
        Arrays.fill(temp, 0.0f);
        // remove cross iteration RAW dependency on 'res' by introducing a
        // temporary work array.
        for (int i = 0; i < SIZE; i++) {
            temp[i] = Math.fma(src1[i], src2[i], temp[i]);
        }
        for (int i = 0; i < SIZE; i++) {
            res += temp[i];
        }
        return res; 
    } 

    public static float dot_product_work_array_stripmined_fma(float [] src1, float [] src2) {
        float res = 0.0f;
        float [] temp = new float[16];
        // remove cross iteration RAW dependency on 'res' by introducing a
        // temporary work array.
        int i = 0;
        for (; i < ((SIZE >> 4) << 4); i += 16) {
            for (int j = i, k = 0; j < i + 16; j++, k++) {
                temp[k] = Math.fma(src1[j], src2[j], temp[k]);
            }
            // Double rounding due to explicit addition.
            for (int l = 0; l < 16; l++) {
               res += temp[l];
            }
            Arrays.fill(temp, 0.0f);
        }
        // tail loop
        for (; i < SIZE; i++) {
            res = Math.fma(src1[i], src2[i], res);
        }
        return res; 
    } 

    public static float dot_product_work_array_stripmined_multipler(float [] src1, float [] src2) {
        float res = 0.0f;
        float [] temp = new float[16];
        // remove cross iteration RAW dependency on 'res' by introducing a
        // temporary work array.
        int i = 0;
        for (; i < ((SIZE >> 4) << 4); i += 16) {
            for (int j = i, k = 0; j < i + 16; j++, k++) {
                temp[k] = src1[j] * src2[j];
            }
            for (int l = 0; l < 16; l++) {
               res += temp[l];
            }
            Arrays.fill(temp, 0.0f);
        }
        // tail loop
        for (; i < SIZE; i++) {
            res = Math.fma(src1[i], src2[i], res);
        }
        return res; 
    } 
    public static float dot_product_vector(float [] src1, float [] src2) {
        FloatVector vtemp = FloatVector.broadcast(FSP, 0.0f);
        int i = 0;
        for (; i < FSP.loopBound(SIZE); i += FSP.length()) {
            FloatVector vsrc1 = FloatVector.fromArray(FSP, src1, i);
            FloatVector vsrc2 = FloatVector.fromArray(FSP, src2, i);
            vtemp = vsrc1.lanewise(VectorOperators.FMA, vsrc2, vtemp);
        }
        float res = vtemp.reduceLanes(VectorOperators.ADD);
        for (; i < SIZE; i++) {
            res = Math.fma(src1[i], src2[i], res);
        }
        return res;
    }

    public static void benchmark(String msg, Micro bm, float[] src1, float [] src2) {
        float res = 0.0f;
        for (int i = 0; i < 1000000; i++) {
            res += bm.apply(src1, src2);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            res += bm.apply(src1, src2);
        } 
        long t2 = System.currentTimeMillis();
        System.out.println("[" + msg + " time] " + (t2-t1) + " ms  [res] " + res);
    } 

    interface Micro {
        public float apply(float [] src1, float [] src2);
    }

    public static void main(String [] args) {
        float [] dst = new float[SIZE];
        float [] src1 = new float[SIZE];
        float [] src2 = new float[SIZE];
        IntStream.range(0, SIZE).forEach(i -> {src1[i] = (float)i;});
        IntStream.range(0, SIZE).forEach(i -> {src2[i] = (float)i;});
     
        benchmark("dot_product", (s1, s2) -> dot_product(s1, s2), src1, src2);
        benchmark("dot_product_work_array", (s1, s2) -> dot_product_work_array(s1, s2), src1, src2);
        benchmark("dot_product_work_array_rem_alloc", (s1, s2) -> dot_product_work_array_rem_alloc(s1, s2), src1, src2);
        benchmark("dot_product_work_array_stripmined_multipler", (s1, s2) -> dot_product_work_array_stripmined_multipler(s1, s2), src1, src2);
        benchmark("dot_product_work_array_stripmined_fma", (s1, s2) -> dot_product_work_array_stripmined_fma(s1, s2), src1, src2);
        benchmark("dot_product_vector", (s1, s2) -> dot_product_vector(s1, s2), src1, src2);
    }
}
