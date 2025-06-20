
import jdk.incubator.vector.*;
import java.util.Arrays;

public class DivB {
    static final int SIZE = 1024;
    static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_128;
    static byte[] a = new byte[SIZE];
    static byte[] b = new byte[SIZE];
    static byte[] r = new byte[SIZE];;

    static byte workload(int ctr) {
       int i = 0;
       VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, 15);
       //for (; i < SIZE; i += SPECIES.length()) {
           ByteVector av = ByteVector.fromArray(SPECIES, a, i);
           ByteVector bv = ByteVector.fromArray(SPECIES, b, i);
           //av.lanewise(VectorOperators.LSHL, 4)
           //  .lanewise(VectorOperators.AND_NOT, bv)
             //.div(bv, mask)
             av.div(bv, mask)
             .intoArray(r, i);
       //}
       return r[ctr];
    }

    public static void main(String args[]) {
        int res = 0;
        for (int i = 0; i < SIZE; i++) {
            a[i] = 1;
            b[i] = 2;
        }

        for (int i = 0; i < 50000; i++) {
            res += workload(i & (SPECIES.length() - 1));
        }
        System.out.println("[res] " +  res);
    }
}
