
import jdk.incubator.vector.*;

class negb {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

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

  public static byte micro(byte [] arr, byte [] res, int ctr, VectorMask<Byte> mask) {
    byte ret   = 0;
    for (int i = 0 ; i < 1024 ; i+= SPECIES.length()) {
        ByteVector.fromArray(SPECIES, arr, i)
       .lanewise(VectorOperators.NEG, mask)
       .intoArray(res,i);
    } 
    ret += res[ctr];
    return ret;
  }

  public static void main(String [] args) {
    byte [] arr = new byte[1024];
    byte [] res = new byte[1024];
    byte ret = 0;
    for (int i = 0 ; i < arr.length ; i++)
      arr[i] = (byte)i;

    VectorMask<Byte> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);

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
