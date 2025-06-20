

import jdk.incubator.vector.VectorSpecies;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.IntVector;

public class Test {
    static final VectorSpecies<Integer> SPECIES =
                IntVector.SPECIES_64;
    static int[] a = new int[1024];
    static int[] b = new int[1024];
    static int[] r = new int[1024];

    static void AND_NOTInt64VectorTests() {
        for (int i = 0; i < a.length; i += SPECIES.length()) {
            IntVector av = IntVector.fromArray(SPECIES, a, i);
            IntVector bv = IntVector.fromArray(SPECIES, b, i);
            av.lanewise(VectorOperators.AND_NOT, bv).intoArray(r, i);
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10000; i++) {
            AND_NOTInt64VectorTests();
        }
        System.out.println(r[0]);
    }
}
