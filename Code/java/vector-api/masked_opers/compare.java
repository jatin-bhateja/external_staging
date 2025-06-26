
import jdk.incubator.vector.*;

class compare {
  public static VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;

  public static int workload(double [] arr1) {
      DoubleVector vec1 = DoubleVector.fromArray(SPECIES, arr1, 0);
      DoubleVector vec2 = DoubleVector.fromArray(SPECIES, arr1, 16);
      VectorMask mres = vec1.compare(VectorOperators.EQ, vec2);
      return mres.trueCount();
  }

  public static void main(String [] args) {
     int res = 0;
     double [] arr1 = new double[1024];
     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = i;
     }

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       res += workload(arr1);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       res += workload(arr1);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);
     System.out.println(res);
  }
}
