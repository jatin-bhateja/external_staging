
import jdk.incubator.vector.*;
import java.util.Arrays;

class gather {
  public static VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
  public static void workload(double [] arr, double [] res) {
    VectorMask<Double> mask = VectorMask.fromLong(SPECIES, 5);
    for(int i = 0; i < arr.length/2; i+=SPECIES.length()) {
        int [] indices = {2, 2, 0, 3 };
        DoubleVector vec = DoubleVector.fromArray(SPECIES, arr, i, indices, 0, mask);
        vec.intoArray(res, 0);
    }
  }

  public static void main(String [] args) {
     double [] arr = new double[1024];
     double [] res = new double[SPECIES.length()*2];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i % SPECIES.length() + 1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++) {
       Arrays.fill(res, 0);
       workload(arr, res);
     }

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (int i = 0 ; i < SPECIES.length(); i++) {
       System.out.println(res[i] + " ");
     }
  }
}
