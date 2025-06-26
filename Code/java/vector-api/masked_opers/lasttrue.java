
import jdk.incubator.vector.*;

class lasttrue {
  public static VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

  public static int micro(boolean [] inp) {
    VectorMask<Float> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.firstTrue();
  }

  public static void main(String [] args) {
     boolean [] inp = {
                       false, false, false, false, false, false, false, false, 
                       false, false, false, false, false, false, true, false
     };
     long val = 0;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += micro(inp);

     // Perf
     val = 0;
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += micro(inp);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
