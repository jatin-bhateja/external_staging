
import jdk.incubator.vector.*;

class not {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static int leaf(int i) {
    return i & 1023;
  }

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

  public static VectorMask<Byte> mask;

  public static int micro(int i ) {
    return mask.not().trueCount() + i;
  }

  public static int workload(byte [] arr, byte [] res, int ctr) {
    int ret   = 0;
    for (int i = 0 ; i < 1024 ; i+= SPECIES.length()) {
      ByteVector vec = ByteVector.fromArray(SPECIES, arr, i);
      vec.lanewise(VectorOperators.NOT, mask).intoArray(res,i);
      //i = leaf(i);
      vec.lanewise(VectorOperators.NOT, mask).intoArray(res,i);
    } 
    ret += res[ctr];
    return ret;
  }

  public static void main(String [] args) {
    int ret = 0;
    byte [] arr = new byte[1024];
    byte [] res = new byte[1024];
    mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
    for (int i = 0 ; i < arr.length ; i++)
      arr[i] = (byte)i;

    // Warmup
    for (int i = 0 ; i < 700000 ; i++)
      ret += micro(i);

    // Perf
    long start = System.currentTimeMillis();
    for (int i = 0 ; i < 900000 ; i++)
      ret += micro(i);

    long time = System.currentTimeMillis() - start;
    System.out.println("[Time] " + time + " ms  [Res] " + ret );
  }
}
