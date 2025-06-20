
import jdk.incubator.vector.*;

class blend {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

  public static int LEN = 1024;

  public static int micro1(int [] r, int [] a , int [] b, int idx) {
     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 255);
     for (int i = 0 ; i <  SPECIES.loopBound(r.length); i+=SPECIES.length()) { 
       IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
       IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
       IV1.blend(IV2, mask).intoArray(r, i);
     }
     return r[idx];
  }

  public static int micro2(int [] r, int [] a , int [] b, int idx) {
     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 255);
     var mvec = mask.toVector();
     for (int i = 0 ; i <  SPECIES.loopBound(r.length); i+=SPECIES.length()) {
       IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
       IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
       ((IntVector)(mvec.lanewise(VectorOperators.NOT)
         .lanewise(VectorOperators.AND, IV1)
         .lanewise(VectorOperators.OR, mvec.lanewise(VectorOperators.AND, IV2))))
         .intoArray(r, i);
     }
     return r[idx];
  }

  public static void main(String [] args) {
     int res = 0;
     int [] a = new int[LEN];
     int [] b = new int[LEN];
     int [] r = new int[LEN];

     for(int i = 0 ; i < LEN ; i++) {
       a[i] = 10;
       b[i] = 20;
     }

     // Warmup.
     for(int i = 0 ; i < 10000000 ; i++) {
        res += micro1(r, a, b, i & (r.length-1));
        res += micro2(r, a, b, i & (r.length-1));
     }

     res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 1000000 ; i++) {
        res += micro1(r, a, b, i & (r.length-1));
     }
     long t2 = System.currentTimeMillis();
     System.out.println("MICRO1 => [Time] " + (t2-t1) + " ms   [Res] " + res);
     for(int i = 0 ; i  < 16 ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }

     res = 0;
     t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 1000000 ; i++) {
        res += micro2(r, a, b, i & (r.length-1));
     }
     t2 = System.currentTimeMillis();
     System.out.println("MICRO2 => [Time] " + (t2-t1) + " ms   [Res] " + res);
     for(int i = 0 ; i  < 16 ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
  }
}
