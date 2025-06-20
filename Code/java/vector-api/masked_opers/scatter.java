
import jdk.incubator.vector.*;
import java.util.Arrays;

class scatter {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
  public static int [] idx = {10, 3, 10, 3, 5, 8, 14, 14, 5, 8, 0, 11, 10, 1, 5, 10};
  public static void workload(int [] arr, int [] res) {
      boolean [] mask_arr = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true};
      VectorMask mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      IntVector vec = IntVector.fromArray(SPECIES, arr, 0);
      vec.lanewise(VectorOperators.ABS, mask).intoArray(res, 0, idx, 0, mask);
  }

  public static void main(String [] args) {
     int [] arr = {0, -5, -10, -15, -20, -25, -30, -35, -40, -45, -50, -55, -60, -65, -70, -75};
     int [] res = new int[16];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);
     System.out.println("arr [] = " + Arrays.toString(arr));
     System.out.println("idx [] = " + Arrays.toString(idx));
     System.out.println("res [] = " + Arrays.toString(res));
  }
}
