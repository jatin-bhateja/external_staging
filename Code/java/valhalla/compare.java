
import jdk.incubator.vector.*;

class compare {

  public static int workload() {
      DoubleVector v1 = DoubleVector.broadcast(DoubleVector.SPECIES_128, 10);
      DoubleVector v2 = DoubleVector.broadcast(DoubleVector.SPECIES_128, 10);
      return v1.compare(VectorOperators.EQ, v2).trueCount(); 
  }

  public static void main(String [] args) {
     int res = 0;
     // Warmup
     for (int i = 0 ; i < 7000 ; i++) {
       res += workload();
     }

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 1000 ; i++) {
       res += workload();
     }
     long time = System.currentTimeMillis() - start;
     System.out.println("[time] " + time + "ms [res] " + res);
  }
}
