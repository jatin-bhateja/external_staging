
import jdk.incubator.vector.*;

class min {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;
  public static void workload(int [] arr, int [] res) {
      boolean [] mask_arr = {true, true, true, true, false, false, false, false};
      VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      IntVector vecv = IntVector.fromArray(SPECIES, arr, 0);
      IntVector resv = IntVector.fromArray(SPECIES, arr, 0);
      resv.lanewise(VectorOperators.MIN, vecv, mask).intoArray(res,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[8];
     int [] res = new int[8];
     for (int i = 0 ; i < arr.length ; i++) {
       arr[i] = i+1;
       res[i] = i+1;
     }

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
