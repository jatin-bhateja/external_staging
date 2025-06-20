
import jdk.incubator.vector.*;
import java.util.Arrays;

public class gatherd_perf_drop {
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   public static void micro(int [] dst, int [] index) {
      int [] src = new int[4096];
      for (int i = 0; i < src.length; i++) {
          src[i] = i;
      }
      IntVector.fromArray(SPECIES, src, 0, index, 0)
                .intoArray(dst, 0);
   }
   public static void main(String [] args) {
      int [] dst = new int[SPECIES.length()];
      int [] index = new int[SPECIES.length()];
      for (int i = 0; i < index.length; i++) {
          index[i] = i * 64;
      }
      for (int i = 0; i < 100000; i++) {
         micro(dst, index);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro(dst, index);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time micro]  " + (t2-t1) + " ms  [dst] = " + Arrays.toString(dst));
   }
}
