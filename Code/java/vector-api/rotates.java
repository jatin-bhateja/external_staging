
import jdk.incubator.vector.*;

class rotate {
  public static void workload(short [] arr, short [] res, int j) {
      ShortVector vec = ShortVector.fromArray(ShortVector.SPECIES_128, arr, 0);
      vec.lanewise(VectorOperators.ROL, ((short)j)).intoArray(res,0);
  }

  public static void main(String [] args) {
     short [] arr = new short[32];
     short [] res = new short[32];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (short)(i+10);

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
