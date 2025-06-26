
import jdk.incubator.vector.*;

class rearrangeb {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static void workload(byte [] arr, byte [] res) {
     boolean [] mask_arr = {
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
        true, true, true, true, false, false, false, false, true, true, true, true, false, false, false, false,
     };
     VectorMask<Byte> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
     var shuf = SPECIES.iotaShuffle(1,1,true);
     ByteVector vec =  (ByteVector)shuf.toVector();
     vec.rearrange(shuf, mask).intoArray(res, 0);
  }

  public static void main(String [] args) {
     byte [] arr = new byte[64];
     byte [] res = new byte[64];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)i;

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
