
import jdk.incubator.vector.*;

class reinterpret {
  public static void workload(long [] arr, long [] res, int j) {
     LongVector LV = LongVector.fromArray(LongVector.SPECIES_256, arr, 0);
     Vector<Long> IV = LV.reinterpretAsLongs();
     ((LongVector)(IV)).intoArray(res,0);
  }

  public static void main(String [] args) {
     long [] arr = new long[4];
     long [] res = new long[4];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+1;

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

