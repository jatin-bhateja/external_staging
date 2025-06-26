
import jdk.incubator.vector.*;

class not {
   public static final int LEN = 1024;
   public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

   public static void workload(int [] r, int [] a, int [] b, int [] c) {
      VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 15);
      for(int i = 0 ; i < r.length; i+=SPECIES.length()) {
         IntVector avec = IntVector.fromArray(SPECIES, a, i);
         IntVector bvec = IntVector.fromArray(SPECIES, b, i);
         IntVector cvec = IntVector.fromArray(SPECIES, c, i);
         avec.lanewise(VectorOperators.AND, bvec)
             .lanewise(VectorOperators.OR, avec)
             .lanewise(VectorOperators.NOT)
             .lanewise(VectorOperators.NOT, mask)
             .reinterpretAsInts()
             .intoArray(r, i);
      }
   }

   public static void main(String [] args) {
      int res = 0;
      int [] a = new int[LEN];
      int [] b = new int[LEN];
      int [] c = new int[LEN];
      int [] r = new int[LEN];

      for(int i = 0 ; i < LEN; i++) {
         a[i] = i;
         b[i] = i+1;
         c[i] = i+2;
      }

      for (int i = 0 ; i < 100000; i++) {
         workload(r, a, b ,c);
      }

      for (int i = 0 ; i < r.length ; i++) {
        res += r[i];
      }
      
      System.out.println("[RES] " + res);
   }
}
