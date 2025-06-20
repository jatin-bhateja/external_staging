
import jdk.incubator.vector.*;

class anytrue {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static int micro(boolean [] inp) {
    VectorMask<Byte> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.eq(mask1).allTrue() ? 1 : 0;
  }

  public static void main(String [] args) {
     boolean [] inp = {
           false, false, false, false, false, true, false, false, false, true, false, true, false, true, false, true,
           false, false, false, false, false, true, false, false, false, true, false, true, false, true, false, true,
           false, false, false, false, false, true, false, false, false, true, false, true, false, true, false, true,
           false, false, false, false, false, true, false, false, false, true, false, true, false, true, false, true
     };
     long val = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += micro(inp);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += micro(inp);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
