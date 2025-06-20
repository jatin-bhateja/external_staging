
import jdk.incubator.vector.*;

class bzero {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static int leaf(int i) {
    return i & 1023;
  }

  public static int workload(byte [] arr, byte [] res, int ctr) {
    ByteVector io2 = (ByteVector) VectorShuffle.iota(SPECIES, 0 , 1, false).toVector();
    return io2.length();
  }

  public static void main(String [] args) {
    byte [] arr = new byte[1024];
    byte [] res = new byte[1024];
    int ret = 0;
    for (int i = 0 ; i < arr.length ; i++)
      arr[i] = (byte)i;

    // Warmup
    for (int i = 0 ; i < 700000 ; i++)
      ret += workload(arr, res, i & (res.length -1));

    // Perf
    long start = System.currentTimeMillis();
    for (int i = 0 ; i < 10000 ; i++)
      ret += workload(arr, res, i & (res.length -1));
    long time = System.currentTimeMillis() - start;
    System.out.println("[Time] " + time + " ms  [Res] " + ret );
  }
}
