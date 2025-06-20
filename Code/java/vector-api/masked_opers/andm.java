
import jdk.incubator.vector.*;

class andm {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

  public static int LEN = 1024;

  public static int micro(int [] r, int [] a , int [] b, int [] maskvec, int idx) {
     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 255);
     for (int i = 0 ; i <  SPECIES.loopBound(r.length); i+=SPECIES.length()) {
       IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
       IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
       IV1.lanewise(VectorOperators.AND_NOT, IV2, mask).intoArray(r, i);
       //IV1.lanewise(VectorOperators.BITWISE_BLEND, IV2, BMASK).intoArray(r, i);
     }
     return r[idx];
  }

  public static void main(String [] args) {
     int res = 0;
     int [] a = new int[LEN];
     int [] b = new int[LEN];
     int [] m = new int[LEN];
     int [] r = new int[LEN];

     for(int i = 0 ; i < LEN ; i++) {
       a[i] = 10;
       b[i] = 20;
       m[i] = -1 * (i & 1);
     }

     for(int i = 0 ; i < 100000 ; i++) {
        res += micro(r, a, b, m, i & (r.length-1));
     }

     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 100000 ; i++) {
        res += micro(r, a, b, m, i & (r.length-1));
     }
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) + " ms   [Res] " + res);
     for(int i = 0 ; i  < 16 ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
  }
}
