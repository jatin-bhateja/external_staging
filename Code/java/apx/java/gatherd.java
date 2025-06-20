
import jdk.incubator.vector.*;
import java.util.Arrays;

public class gatherd {
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   // Inject dummy arguments to consume first 6 CC registers.
   public static void micro(int d1, int d2, int d3, int d4, int d5, int d6, int [] dst, int [] src, int [] index) {
       IntVector.fromArray(SPECIES, src, 0, index, 0)
                .intoArray(dst, 0);
   }
   public static void main(String [] args) {
      int [] dst = new int[SPECIES.length()];
      int [] src = new int[4096];
      int [] index = new int[SPECIES.length()];
      for (int i = 0; i < src.length; i++) {
          src[i] = i;
      }
      for (int i = 0; i < index.length; i++) {
          index[i] = i * 64;
      }
      for (int i = 0; i < 100000; i++) {
         micro(1, 2, 3, 4, 5, 6, dst, src, index);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro(1, 2, 3, 4, 5, 6, dst, src, index);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time micro]  " + (t2-t1) + " ms  [dst] = " + Arrays.toString(dst));
   }
}
