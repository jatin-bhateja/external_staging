
import jdk.incubator.vector.*;

class neg {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
  public static boolean [] mask_arr = {
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false,
       true, true, true, true, false, false, false, false
  };


  public static int micro(int [] arr, int [] res, int ctr, VectorMask<Integer> mask) {
    int ret   = 0;
    for (int i = 0 ; i < 1024 ; i+= SPECIES.length()) {
        IntVector.fromArray(SPECIES, arr, i)
       .lanewise(VectorOperators.NEG, mask)
       .intoArray(res,i);
    } 
    ret += res[ctr];
    return ret;
  }

  public static void main(String [] args) {
    int [] arr = new int[1024];
    int [] res = new int[1024];
    int ret = 0;
    for (int i = 0 ; i < arr.length ; i++)
      arr[i] = (int)i;

    VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);

    // Warmup
    for (int i = 0 ; i < 7000000 ; i++)
      ret += micro(arr, res, i & (res.length -1), mask);

    // Perf
    long start = System.currentTimeMillis();
    for (int i = 0 ; i < 1000000 ; i++)
      ret += micro(arr, res, i & (res.length -1), mask);
    long time = System.currentTimeMillis() - start;
    System.out.println("[Time] " + time + " ms  [Res] " + ret );
  }
}
