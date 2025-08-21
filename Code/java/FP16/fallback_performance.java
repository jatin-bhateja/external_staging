
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class fallback_performance {

    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    public static void kernel1(float [] dst, float [] src1, float [] src2, float [] src3) {
        for (int i = 0; i < FSP.loopBound(dst.length) ; i += FSP.length()) {
            FloatVector.fromArray(FSP, src1, i)
                       .lanewise(VectorOperators.FMA, FloatVector.fromArray(FSP, src2, i),
                                                      FloatVector.fromArray(FSP, src3, i))
                       .intoArray(dst, i);
        }
    }

    public static void kernel2(float [] dst, float [] src1, float [] src2, float [] src3) {
        for (int i = 0; i < dst.length; i++) {
            dst[i] = Math.fma(src1[i], src2[i], src3[i]);
        }
    }

    interface BenchMark {
        public void apply(float [] dst, float [] src1, float [] src2, float [] src3);
    }

    public static void runBM(String msg, BenchMark bm, float [] dst, float [] src1, float [] src2, float [] src3) {
        for (int i = 0; i < 100000; i++) {
            bm.apply(dst, src1, src2, src3);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            bm.apply(dst, src1, src2, src3);
        }
        long t2 = System.currentTimeMillis();
        System.out.println(msg + " [time] " + (t2 - t1) + "ms");
    }

    public static void main(String [] args) {
        float [] src1 = new float[4096];
        float [] src2 = new float[4096];
        float [] src3 = new float[4096];
        float [] dst = new float[4096];
        
        IntStream.range(0, src1.length).forEach(i -> {src1[i] = (float)i;});
        IntStream.range(0, src2.length).forEach(i -> {src2[i] = (float)i;});
        IntStream.range(0, src3.length).forEach(i -> {src3[i] = (float)i;});
 
        if (Integer.parseInt(args[0]) == 1) {
            runBM("kernel1: non-intrinsic + boxing", (d, s1, s2, s3) -> kernel1(d, s1, s2, s3), dst, src1, src2, src3);
        } else {
            runBM("kernel2: auto-vectorization", (d, s1, s2, s3) -> kernel2(d, s1, s2, s3), dst, src1, src2, src3);
        }
    }   
}
