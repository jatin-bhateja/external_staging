
import jdk.incubator.vector.*;

class compare_vector {
  public static void workload(boolean [] res) {
      IntVector v1 = IntVector.broadcast(IntVector.SPECIES_128, 10);
      v1 = v1.withLane(1, 20);
      v1 = v1.withLane(2, 30);
      v1 = v1.withLane(3, 40);
      IntVector v2 = IntVector.broadcast(IntVector.SPECIES_128, 10);
      v2 = v2.withLane(1, 20);
      v2 = v2.withLane(2, 30);
      v2 = v2.withLane(3, 40);
      res[0] = v1 == v2; 
  }

  public static void main(String [] args) {
     int  [] arr = new int[16];
     boolean [] res = new boolean[16];

     // Warmup
     for (int i = 0 ; i < 7000 ; i++)
       workload(res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100 ; i++)
       workload(res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
