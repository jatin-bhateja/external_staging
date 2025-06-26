
import jdk.incubator.vector.*;

class shift {
  public static VectorSpecies SPECIES = IntVector.SPECIES_256;
 
  public static void workload(int [] arr, int [] res, int j) {
      boolean [] mask_arr = {
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false
      };
      VectorMask mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      IntVector vec = IntVector.fromArray(IntVector.SPECIES_256, arr, 0);
      vec.lanewise(VectorOperators.ASHR, 10, mask).intoArray(res,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[8];
     int [] res = new int[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+10;

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
