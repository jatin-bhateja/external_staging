
import java.util.stream.*;
import jdk.incubator.vector.*;
import java.util.Arrays;

public class gather {
   public static final VectorSpecies<Byte> SPECIES  = ByteVector.SPECIES_PREFERRED;
   public static final VectorMask<Byte> MASK = VectorMask.fromLong(SPECIES, 0x5555555555555555L);

   public static void micro(int [] index, byte [] res, byte [] src) {
      ByteVector.fromArray(SPECIES, src, 0, index, 0, MASK)
                .intoArray(res, 0);
   }

   public static final int SIZE  = 4096;
   public static final int LANES_M1 = SPECIES.length() - 1;

   public static void main(String [] args) {
       byte [] src =  new byte[SIZE];
       byte [] res =  new byte[SPECIES.length()];
       for (int i = 0; i < SIZE; i++) {
          src[i] = (byte)i;
       }
       int [] index = IntStream.iterate(0, i -> i < SIZE, i -> i + 64).toArray();

       for (int i = 0; i < 400000; i++) {
           micro(index, res, src);
       }

       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 200000; i++) {
           micro(index, res, src);
       }
       long t2 = System.currentTimeMillis();

       System.out.println("[time]  " + (t2 - t1) + " ms");
       System.out.println("[res] " + Arrays.toString(res));
   }
}
