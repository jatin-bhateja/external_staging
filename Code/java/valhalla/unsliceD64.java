
import java.util.Arrays;
import jdk.incubator.vector.*;

public class unsliceD64 {

   public static final int SIZE  = 256;

   public static final VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_512;

   public static double micro (double [] res, double [] a, double [] b, int ctr) {
      for (int i = 0; i < a.length; i += SPECIES.length()) {
          int part = i & 0x1;
          DoubleVector va = DoubleVector.fromArray(SPECIES, a, i);
          DoubleVector vb = DoubleVector.fromArray(SPECIES, b, i);
          va.unslice(0, vb, part).intoArray(res, i);
      }
      return res[ctr];
   }

   public static void main(String [] args) {
      double res = 0.0;
      double [] r = new double[SIZE];
      double [] a = new double[SIZE];
      double [] b = new double[SIZE];
      Arrays.fill(a, 1.0);
      for (int i = 0; i < 10000; i++) {
          res += micro(r, a, b, 0);
      } 
      System.out.println("[res] " + res);
   }
}


