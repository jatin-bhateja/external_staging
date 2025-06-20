
import jdk.incubator.vector.*;

class rearranges {
  public static VectorSpecies<Short> SPECIES = ShortVector.SPECIES_512;

  public static void workload(short [] arr, short [] res) {
     boolean [] mask_arr = {
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
     };
     VectorMask<Short> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
     var shuf = SPECIES.iotaShuffle(1,1,true);
     ShortVector vec =  (ShortVector)shuf.toVector();
     vec.rearrange(shuf, mask).intoArray(res, 0);
  }

  public static void main(String [] args) {
     short [] arr = new short[64];
     short [] res = new short[64];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (short)i;

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
