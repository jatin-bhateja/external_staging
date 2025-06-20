
import jdk.incubator.vector.*;

class rearrangel {
  public static VectorSpecies<Long> SPECIES = LongVector.SPECIES_512;

  public static void workload(long [] arr, long [] res) {
     boolean [] mask_arr = {
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
     };
     VectorMask<Long> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
     var shuf = SPECIES.iotaShuffle(1,1,true);
     LongVector vec =  (LongVector)shuf.toVector();
     vec.rearrange(shuf, mask).intoArray(res, 0);
  }

  public static void main(String [] args) {
     long [] arr = new long[64];
     long [] res = new long[64];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (long)i;

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
