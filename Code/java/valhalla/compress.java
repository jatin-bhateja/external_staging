
import jdk.incubator.vector.*;

class compress {
  public static final VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_64;

  public static void workload(double [] r, double [] a, VectorMask<Double> mask) {
    int i = 0;
    for(; i < SPECIES.loopBound(a.length) ; i+=SPECIES.length()) {
      DoubleVector IV1 = DoubleVector.fromArray(SPECIES, a, i);
      IV1 = IV1.compress(mask);
      IV1.intoArray(r, i);
    }
  }

  public static void main(String [] args) {
     double [] a = new double[SPECIES.length()];
     double [] r = new double[SPECIES.length()];

     VectorMask<Double> mask = VectorMask.fromLong(SPECIES, 43690);
     a[0] = 0.0;
   
     for(int i = 0 ; i < 100000 ;i++) {
          workload(r, a, mask);
     }

     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 50000 ;i++) {
          workload(r, a, mask);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms");
     for(int i = 0; i  < SPECIES.length() ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
  }
}
