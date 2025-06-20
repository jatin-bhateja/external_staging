

import jdk.incubator.vector.*;
import java.util.Arrays;

public class masked_load {
    public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

    public static final VectorMask<Integer> VMASK = VectorMask.fromLong(IntVector.SPECIES_256, 170);
    
    public static void micro(int [] res, int [] src) {
        IntVector.fromArray(SPECIES, src, 0, VMASK)
                 .intoArray(res, 0);
    }

    public static void main(String [] args) {
        int [] src = new int[8];
        int [] res = new int[8];
        Arrays.fill(src, 10);
        for (int i = 0; i < 100000; i++) {
            micro(res, src);
        }
        System.out.println(Arrays.toString(res));
    }
}
