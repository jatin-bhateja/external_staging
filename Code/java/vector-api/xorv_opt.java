
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class xorv_opt {
    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    public static long micro(float [] dst, float [] src1, float [] src2, int idx) {
        return FloatVector.fromArray(FSP, src1, idx)
                  .compare(VectorOperators.EQ, FloatVector.fromArray(FSP, src2, idx))
                  .not()
                  .toLong();
    }

    public static void main(String [] args) {
        float [] src1 = new float[4096];
        float [] src2 = new float[4096];
        float [] dst = new float[4096];
        IntStream.range(0, dst.length).forEach(
            i -> {
                src1[i] = 1.0f;
                src2[i] = 2.0f;
            } 
        );
        long res = 0;
        for (int i = 0; i < 100000; i++) {
            for (int j = 0; j < FSP.loopBound(dst.length); j += FSP.length()) {
                res += micro(dst, src1, src2, j);
            }
        }
        System.out.println("[res] " + res);
    }
}
