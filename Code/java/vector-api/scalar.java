
import jdk.incubator.vector.*;

class scalar {
  public static void workload(int [] arr, int [] res, int j) {
      //IntVector vec = IntVector.scalars(IntVector.SPECIES_256, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
      IntVector vec = IntVector.scalars(IntVector.SPECIES_256, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      vec.intoArray(res,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[8];
     int [] res = new int[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 0;

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
