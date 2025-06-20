
import jdk.incubator.vector.*;

class not {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;
  public static int workload() {
    boolean [] mask_arr = {true, true, true, true, false, false, false, false};
    VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
    return mask.not().trueCount();
  }

  public static void main(String [] args) {
     long res = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       res += workload();

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       res += workload();
     long time = System.currentTimeMillis() - start;

     System.out.println("Time = " + time);
     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
