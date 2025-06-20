
import jdk.incubator.vector.*;

class storems {
  public static boolean flag = true;
  public static final VectorSpecies<Short> SPECIES = ShortVector.SPECIES_256;

  public static short workload(short [] d, short [] s, int ctr) {
    for(int i = 0; i < SPECIES.loopBound(s.length); i+=SPECIES.length()) {
      VectorMask<Short> mask = VectorMask.fromLong(SPECIES, 12345);
      //ShortVector vec = ShortVector.fromArray(SPECIES, s, i, mask);
      ShortVector vec = ShortVector.fromArray(SPECIES, s, i);
      vec.intoArray(d, i, mask);
    }
    return d[ctr];
  }

  public static void main(String [] args) {
     short res = 0;
     short [] r = new short[1030];
     short [] s = new short[1030];
     for(int i = 0 ; i < s.length ; i++) {
         s[i] = (short)i;
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
