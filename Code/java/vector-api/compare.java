
import jdk.incubator.vector.*;

class compare {
  public static void workload(boolean [] res) {
      VectorMask IV1 = VectorMask.fromLong(ShortVector.SPECIES_64, -1L);
      VectorMask IV2 = VectorMask.fromLong(ShortVector.SPECIES_64, -1L);
      VectorMask Res = IV1.lt(IV2);
      Res.intoArray(res,0);
  }

  public static void main(String [] args) {
     int  [] arr = new int[16];
     boolean [] res = new boolean[16];
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
