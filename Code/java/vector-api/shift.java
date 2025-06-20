
import jdk.incubator.vector.*;

class shift {
  public static void workload(int [] arr, int [] res, int j) {
      IntVector vec = IntVector.fromArray(IntVector.SPECIES_512, arr, 0);
      vec.lanewise(VectorOperators.LSHR, 5).intoArray(res,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[16];
     int [] res = new int[16];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = -1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res, i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res, i);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
