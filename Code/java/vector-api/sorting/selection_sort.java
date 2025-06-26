
import jdk.incubator.vector.*;

// DNC based sorts are good candidates for vectorization.
// Quicksort, merge-sort.
// 
// Non-DNC sorts may not be useful like insertion, selection, bubble.
//
// Linear time sorting, radix, bucket.
//
//
// Ultra-fast min/max.
// 
class selection_sort {
   public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
   
   // First 16 min-values.
   public static int vector_min(int [] src) {
      IntVector MINV = SPECIES.broadcast(Integer.MAX_VALUE);
      for(int i = 0; i < SPECIES.loopBound(src.length); i+=SPECIES.length()) {
         MINV = IntVector.fromArray(SPECIES, src, i)
                         .lanewise(VectorOperators.MIN, MIN);
      }
      return MINV.reducelanes(VectorOperators.MIN);
   }
   public static void vector(int [] res, int [] src) {
      for(int i = 0; i < SPECIES.loopBound(res.length); i++) {
          
      } 
   }



}
