
import jdk.incubator.vector.*;

class shift {
  public static VectorSpecies SPECIES = IntVector.SPECIES_256;
  public static Vector<Integer> shiftv;
  public static VectorMask<Integer> mask;
  public static boolean [] mask_arr = {
        true, true, true, true, true, true, true, true,
        true, true, true, true, true, true, true, true,
        true, true, true, true, true, true, true, true,
        true, true, true, true, true, true, true, true
  };
 
  public static void workload(int [] arr, int [] res, int j) {
      //VectorMask mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      IntVector vec = IntVector.fromArray(SPECIES, arr, 0);
      //vec.lanewise(VectorOperators.ASHR, shiftv, mask).intoArray(res,0);
      vec.lanewise(VectorOperators.LSHL, vec, mask).intoArray(res,0);
      //vec.lanewise(VectorOperators.LSHL, j, mask).intoArray(res,0);
      //vec.lanewise(VectorOperators.LSHL, vec, mask).intoArray(res,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[16];
     int [] res = new int[16];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = -5;

     mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
     shiftv = SPECIES.broadcast(2);
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res, 2);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res, 2);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
