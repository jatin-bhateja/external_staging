
import jdk.incubator.vector.*;
import java.util.Arrays;

public class DivF256 {
    public static final int LEN = 1024;
    public static final int INVOC_COUNT = 1;
    public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

    public static float micro(float [] r, float [] a, float [] b, int ctr) {
        for (int ic = 0; ic < INVOC_COUNT; ic++) {
            for (int i = 0; i < a.length; i += SPECIES.length()) {
                FloatVector av = FloatVector.fromArray(SPECIES, a, i);
                FloatVector bv = FloatVector.fromArray(SPECIES, b, i);
                av.lanewise(VectorOperators.DIV, bv).intoArray(r, i);
            }
        }
        return r[ctr];
    }
    public static void main(String[] args) throws Exception {
        float[] a = new float[LEN];
        float[] b = new float[LEN];
        float[] r = new float[LEN];
      
        Arrays.fill(a, 4.0f);
        Arrays.fill(b, 2.0f);

        float val = 0.0f;
        for(int i = 0; i < 10000; i++) {
            val += micro(r, a, b, i & 511);
        }
        System.out.println(val);
    }
}

