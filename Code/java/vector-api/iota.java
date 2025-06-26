
import jdk.incubator.vector.*;
import java.util.Arrays;

class test {
   public static final VectorSpecies<Long> SPECIES = LongVector.SPECIES_256;

   public static void workload(long [] res) {
     VectorShuffle.iota(SPECIES, 0, -2, false)
                  .toVector()
                  .reinterpretAsLongs()
                  .intoArray(res, 0);
   }

   public static void main(String [] args) {
      long [] res = new long[SPECIES.length()];
      for (int i = 0 ; i < 100000; i++) {
         workload(res);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0 ; i < 100000; i++) { 
         workload(res);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] "  + Arrays.toString(res));
   }
}
