
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

class AddTestI {
    static final VectorSpecies SPECIES = IntVector.SPECIES_256;

    static final int SIZE = 256;
    static int[] a = new int[SIZE];
    static int[] b = new int[SIZE];
    static int[] c = new int[SIZE];

    static void workload(int index) {
        //for (int i = 0; i < a.length; i += SPECIES.length()) {
            IntVector av = IntVector.fromArray(SPECIES, a, index);
            IntVector bv = IntVector.fromArray(SPECIES, b, index);
            av.add(bv).intoArray(c, index);
        //}
    }

    public static void main(String args[]) {
        int vec = 0;
        for (int i = 0; i < SIZE; i++) {
            a[i] = 1;
            b[i] = 2;
        }
        for (int i = 0; i < 100000; i++) {
            workload(i & 127);
            vec += c[0];
        }
        System.out.println("Res = " + vec);
    }
}
