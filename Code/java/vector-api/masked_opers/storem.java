
import jdk.incubator.vector.*;

class storem {
  public static boolean flag = true;
  public static final VectorSpecies<Long> SPECIES = LongVector.SPECIES_256;

  public static long workload(long [] d, long [] s, int ctr) {
    VectorMask<Long> mask = VectorMask.fromLong(SPECIES, 3);
    for(int i = 0; i < SPECIES.loopBound(s.length); i+=SPECIES.length()) {
      LongVector vec = LongVector.fromArray(SPECIES, s, i);
      vec.intoArray(d, i, mask);
    }
    return d[ctr];
  }

  public static void main(String [] args) {
     long res = 0;
     long [] r = new long[1024];
     long [] s = new long[1022];
     for(int i = 0 ; i < s.length ; i++) {
         s[i] = (long)i;
     }
     for(int i = 0 ; i < 90000 ;i++) {
          res += workload(r, s, i & 7);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 90000 ;i++) {
          res += workload(r, s, i & 7);
     }
     long t2 = System.currentTimeMillis();
     for(int i = 0; i  < SPECIES.length() ; i++)
       System.out.println("r[" + i + "] = " + r[i]);
     System.out.println("[Res] " + res + " [Time] " + (t2-t1) + " ms ");
  }
}
