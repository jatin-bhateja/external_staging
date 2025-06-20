
import jdk.incubator.vector.*;
import java.util.Arrays;

public class null_converged {
    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;
    public static final FloatVector zero = FloatVector.broadcast(FSP, 0);

    public static void micro(boolean some_cond, float [] res, float [] arr, int cnt) {
         FloatVector vres = zero;
         if (some_cond) {
            vres = FloatVector.fromArray(FSP, arr, 0);
         }
         // Phi = entry:zero , some_cond_blk:vres
         if ((arr[0] + cnt) >= 99999.0f) {
            // UCT
            System.out.println(vres);
         }
         vres.intoArray(res, 0);
    }
    public static void main(String [] args) {
        float [] arr = {0, 1, 2, 3, 4, 5, 6, 7};
        float [] res = new float[8];
        for (int i = 0; i < 100000; i++) {
           micro((i % 2) == 0, res, arr, i);
        }
        System.out.println(Arrays.toString(arr));
    }
}
