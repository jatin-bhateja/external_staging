
import java.util.stream.*;
import jdk.incubator.vector.*;

public class gatherbyte_PERFERRED {
   public static final VectorSpecies<Byte> SPECIES  = ByteVector.SPECIES_PERFERRED;

   public static int micro(int [] index, byte [] src) {
      return ByteVector.fromArray(SPECIES, src, 0, index, 0)
                       .reduceLanes(VectorOperators.ADD);
   }

   public static final int SIZE  = 4096;
   public static final int LANES_M1 = SPECIES.length() - 1;

   public static void main(String [] args) {
       long res = 0;
       byte [] src =  new byte[SIZE];
       for (int i = 0; i < SIZE; i++) {
          src[i] = (byte)i;
       }
       int [] index = IntStream.iterate(0, i -> i < SIZE, i -> i + 64).toArray();

       for (int i = 0; i < 400000; i++) {
           res += micro(index, src);
       }

       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 200000; i++) {
           res += micro(index, src);
       }
       long t2 = System.currentTimeMillis();

       System.out.println("[time]  " + (t2 - t1) + " ms   [res] " + res);
   }
}
