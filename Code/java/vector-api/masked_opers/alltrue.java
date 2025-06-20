
import jdk.incubator.vector.*;

class alltrue {
  public static VectorSpecies<Long> SPECIES = LongVector.SPECIES_256;

  public static int micro(boolean [] inp) {
    VectorMask<Long> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.allTrue() ? 1 : 0;
  }

  public static void main(String [] args) {
     boolean [] inp = {true, true, true, true, false, true, false, true, false, true, false, true, false, true, false, true};
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
