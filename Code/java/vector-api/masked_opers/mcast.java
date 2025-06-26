
import jdk.incubator.vector.*;

class mcast {

  public static int workload(int i) {
      boolean [] inp = {
                       true, true, true, true, true, true, true, true,
                       true, true, true, true, true, true, true, true,
                       true, true, true, true, true, true, true, true,
                       true, true, true, true, true, true, true, true
      };

      VectorMask mask = VectorMask.fromArray(FloatVector.SPECIES_256, inp, 0);
      VectorMask<Integer> outmask = mask.cast(IntVector.SPECIES_256);
      return outmask.trueCount() + i;
  }

  public static void main(String [] args) {
     long res = 0L;
  
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       res += workload(i);

     // Perf
     res = 0;
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       res += workload(i);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] " + time + "ms  [Res] " + res);
  }
}
