
import java.util.stream.*;
import jdk.incubator.vector.*;
import java.util.Arrays;

public class gatherI {
   public static final VectorSpecies<Integer> SPECIES  = IntVector.SPECIES_PREFERRED;

   public static void micro(int [] index, int [] res, int [] src) {
      IntVector.fromArray(SPECIES, src, 64, index, 0)
                .intoArray(res, 0);
   }

   public static final int SIZE  = 4096;
   public static final int LANES_M1 = SPECIES.length() - 1;

   public static void main(String [] args) {
       int [] src =  new int[SIZE];
       int [] res =  new int[SPECIES.length()];
       int [] index = new int[SIZE];
       for (int i = 0; i < SIZE; i++) {
          src[i] = (int)i;
          index[i] = i;
       }
       //int [] index = IntStream.iterate(0, i -> i < SIZE, i -> i + 64).toArray();

       for (int i = 0; i < 400000; i++) {
           micro(index, res, src);
       }

       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 200000; i++) {
           micro(index, res, src);
       }
       long t2 = System.currentTimeMillis();

       System.out.println("[time]  " + (t2 - t1) + " ms   [res] " + Arrays.toString(res));
   }
}
