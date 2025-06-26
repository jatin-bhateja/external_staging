
import jdk.incubator.vector.*;

class compare {
  public static void workload(boolean [] res) {
      IntVector v1 = IntVector.broadcast(IntVector.SPECIES_256, 10);
      IntVector v2 = IntVector.broadcast(IntVector.SPECIES_256, 10);
      res[0] = v1 == v2; 
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
