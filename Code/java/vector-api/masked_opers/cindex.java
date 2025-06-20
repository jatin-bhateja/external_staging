
import jdk.incubator.vector.*;

class cindex {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

  public static int workload(int [] arr, int idx) {
      IntVector vec = IntVector.fromArray(SPECIES, arr, 0);
      //if (vec.compare(VectorOperators.LT, 0).or(vec.compare(VectorOperators.GE, idx)).anyTrue()) {
      if (vec.compare(VectorOperators.LT, 0).anyTrue()) {
          return 1;
      }
      return 0;
  }

  public static void main(String [] args) {
     int res = 0;
     int [] arr = new int[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       res += workload(arr, 1024);

     // Perf
     res = 0;
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       res += workload(arr, 1024);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time + " Res = " + res);
  }
}
