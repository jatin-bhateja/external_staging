
import jdk.incubator.vector.*;

class fma {

  public static VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_512;

  public static void workload(double[] arr1, double[] arr2, double[] arr3, double[] res) {
    boolean [] mask_arr = {true, true, true, true, true, true, true, true};
    VectorMask<Double> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
    DoubleVector vec1 = DoubleVector.fromArray(SPECIES, arr1, 0);
    DoubleVector vec2 = DoubleVector.fromArray(SPECIES, arr2, 0);
    DoubleVector vec3 = DoubleVector.fromArray(SPECIES, arr3, 0);
    vec1.lanewise(VectorOperators.FMA, vec2, vec3, mask).intoArray(res,0);
  }

  public static void main(String [] args) {
    double [] arr1 = new double[8];
    double [] arr2 = new double[8];
    double [] arr3 = new double[8];
    double [] res  = new double[8];
    for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = i*2.0f;
       arr2[i] = i*3.0f;
       arr3[i] = i*4.0f;
    }

    // Warmup
    for (int i = 0 ; i < 700000 ; i++)
      workload(arr1, arr2, arr3, res);

    // Perf
    long start = System.currentTimeMillis();
    for (int i = 0 ; i < 1000000 ; i++)
      workload(arr1, arr2, arr3, res);
    long time = System.currentTimeMillis() - start;
    System.out.println("Time = " + time);

    for (var elem : res) {
      System.out.println(elem + " ");
    }
  }
}
