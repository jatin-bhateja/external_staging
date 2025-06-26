
import jdk.incubator.vector.*;

class mask {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static int workload8(int i) {
    VectorMask<Byte> mask1 = SPECIES.maskAll(true);
    VectorMask<Byte> mask2 = SPECIES.maskAll(false);
    return mask1.or(mask2).lastTrue() & i;
  }

  public static void main(String [] args) {
     long val = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += workload8(i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += workload8(i);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
