
import jdk.incubator.vector.*;

class rearrange {
  public static VectorMask<Integer> mask;
  public static VectorShuffle<Integer> shuf;
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

  public static void workload(int [] arr, int [] res) {
     for (int i = 0 ; i < res.length; i+=SPECIES.length()) {
       //IntVector.fromArray(SPECIES, arr, i)
       ((IntVector)(SPECIES.iotaShuffle(0, 1, false).toVector()))
         //.rearrange(shuf)
         .intoArray(res, i);
     }
  }

  public static void main(String [] args) {
     int [] arr = new int[1024];
     int [] res = new int[1024];

     boolean [] mask_arr = {
        true, true, true, true, false, false, false, false, 
        true, true, true, true, false, false, false, false
     };      
     mask = VectorMask.fromArray(SPECIES, mask_arr, 0);

     shuf = SPECIES.iotaShuffle(0,1,false);

     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = -i;

     // Warmup
     for (int i = 0 ; i < 70000; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 10000; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (int i = 0; i < SPECIES.length(); i++) {
       System.out.println(res[i]);
     }
  }
}
