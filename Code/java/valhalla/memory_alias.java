
import java.util.Arrays;
import java.lang.reflect.*;
import jdk.incubator.vector.*;

public class memory_alias {
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

   static int copyMemI16(int [] dst, int [] arr) {
      IntVector.fromArray(SPECIES, arr, 0)
               .intoArray(dst, 0);
      dst[1] = 20;
      arr[1] = 30;
      return dst[1] + 10;
   }

   static int backToBackStoreI(int [] dst) {
      dst[0]  = 10; // StoreI -> (aidx=x) MemMerge --|
                    // |------------------- |
      dst[1]  = 20; // |--> StoreI -> (aidx=x) MemMerge
      return dst[1];
   }

   public static void main(String [] args) {
      int res = 0;
      int [] arr = (int [])Array.newInstance(int.class, 16);
      int [] dst = (int [])Array.newInstance(int.class, 16);
      Arrays.fill(arr, 10);
      for(int i = 0; i < 10000; i++) {
         res += copyMemI16(dst, arr);
         //res += backToBackStoreI(dst);
      }
      System.out.println("[Res] " + res);
   }
}

