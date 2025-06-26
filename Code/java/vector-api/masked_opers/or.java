
import jdk.incubator.vector.*;

class or {
  public static VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;

  public static int LEN = 1024;

  public static int micro(int idx) {
     VectorMask<Double> mask = VectorMask.fromLong(SPECIES, 255);
     return mask.and(mask).trueCount() + idx;
  }

  public static void main(String [] args) {
     int res = 0;
     for(int i = 0 ; i < 100000 ; i++) {
        res += micro(i);
     }

     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 100000 ; i++) {
        res += micro(i);
     }
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) + " ms   [Res] " + res);
  }
}
