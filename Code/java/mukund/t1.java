import jdk.incubator.vector.*;

class jitvec {
   public static VectorSpecies SPECIES = LongVector.SPECIES_PREFERRED;

   private static long shiftLongsVec(long[] a, int count, long[] b, int bi, int shift, long mask) {
     int i = 0;
     // It is assumed array arguments are of the same size
     for (; i < SPECIES.loopBound(a.length-16); i += SPECIES.length()) {
        LongVector va = LongVector.fromArray(SPECIES, a, i);
        va.lanewise(VectorOperators.LSHR,shift).lanewise(VectorOperators.AND,mask).intoArray(b, i+bi);
     }

     for (; i < a.length-16; i++) {
       b[i+bi] = (a[i] >>> shift) & mask;
     }
     return b[i+bi -1];
   }

   public static void main (String [] args) {
     long Res = 0 ;
     long [] a = new long[1024];
     long [] b = new long[1024];
     for(int i = 0 ; i < 1024; i++) {
       a[i] = b[i] = i;
     }

     // Warmup
     for ( int i = 0 ; i < 1000000 ; i++)  {
       Res += shiftLongsVec(a, 1024, b, 16, i, -1L);
     }
     long t1 = System.currentTimeMillis();
     for ( int i = 0 ; i < 100000 ; i++)  {
       Res += shiftLongsVec(a, 1024, b, 16, i, -1L);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time ] " + (t2-t1) + "ms [Res ] " + Res);
  }
}
