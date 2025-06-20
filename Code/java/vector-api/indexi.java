import jdk.incubator.vector.*;
class indexvec {
   static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   //public static long micro(int offset, int limit) {
   //   return VectorMask.fromLong(IntVector.SPECIES_512, -1).indexInRange(offset, limit).toLong();
   //}

   public static int micro(int [] res, int [] arr, int limit, int ctr) {
      for(int i = 0;  i < limit; i += SPECIES.length()) {
          VectorMask<Integer> m = SPECIES.indexInRange(i, limit);
          IntVector.fromArray(SPECIES, arr, i, m)
                    .intoArray(res, i, m);
      }
      return res[ctr];
   }
   public static void main(String [] args) {
/*    long res = 0;
      for (int i = 0; i < 8192; i++) {
         //res += micro(i, 8192 + 17); General case => maskAll(true)
         res += micro(i, 8192);  // special case in tail [8177, 8192)
         //res += micro(i, 0);  // special case offset > limit
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 8192; i++) {
         //res += micro(i, 8192 + 17); General case => maskAll(true)
         res += micro(i, 8192);  // special case in tail [8177, 8192)
         //res += micro(i, 0);  // special case offset > limit
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) + "ms [Res] " + res);
*/
      int [] res = new int[1027];
      int [] arr = new int[1027];
      for(int i  = 0; i < arr.length; i++) {
         arr[i] = i;
      }
      long val = 0;
      for (int i = 0; i < 100000; i++) {
         val += micro(res, arr, 1027, i & 1023);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         val += micro(res, arr, 1027, i & 1023);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) + "ms [Res] " + val);
   }
}
