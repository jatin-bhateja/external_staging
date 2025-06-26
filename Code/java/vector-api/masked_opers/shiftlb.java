
import jdk.incubator.vector.*;

class shiftlb {
  public static VectorSpecies SPECIES = ByteVector.SPECIES_256;
 
  public static void workload(byte [] arr, byte [] res, int j) {
      boolean [] mask_arr = {
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false,
        true, true, false, false, true, true, false, false
      };
      
      VectorMask mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      ByteVector vec = ByteVector.fromArray(SPECIES, arr, 0);
      vec.lanewise(VectorOperators.LSHL,7,mask).intoArray(res,0);
  }

  public static void main(String [] args) {
     byte [] arr = new byte[32];
     byte [] res = new byte[32];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)(i);

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
