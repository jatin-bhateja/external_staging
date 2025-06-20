
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test {
    public static final VectorSpecies<Float> SP = FloatVector.SPECIES_PREFERRED;

    public static float dot_product(float [] src1, float [] src2) {
        FloatVector res = FloatVector.broadcast(SP, 0.0f);
        for (int i = 0; i < SP.loopBound(src1.length); i += SP.length())  {
            res = FloatVector.fromArray(SP, src1, i)
                      .lanewise(VectorOperators.FMA,
                                FloatVector.fromArray(SP, src2, i), res);
        }
        return res.reduceLanes(VectorOperators.ADD);
    }

    public static void main(String [] args) {
        int len = Integer.parseInt(args[0]);
        float [] src1 = new float[len];
        float [] src2 = new float[len];
        IntStream.range(0, len).forEach(
            i -> {
               src1[i] = java.util.concurrent.ThreadLocalRandom.current().nextFloat(Float.MAX_VALUE);
               src2[i] = java.util.concurrent.ThreadLocalRandom.current().nextFloat(Float.MAX_VALUE);
            }
        );
        float res = 0.0f;
        for (int i = 0; i < 100000; i++) {
            res += dot_product(src1, src2);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            res += dot_product(src1, src2);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
    }
}
