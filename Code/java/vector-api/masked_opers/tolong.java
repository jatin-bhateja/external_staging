
import jdk.incubator.vector.*;

class tolong {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

  public static long micro(boolean [] inp, int idx) {
    VectorMask<Integer> mask1 = VectorMask.fromLong(SPECIES, 15);
    return mask1.toLong()  + idx;
  }

  public static void main(String [] args) {
     boolean [] inp = {
                       true, true, true, true, true, true, true, true, 
                       true, true, true, true, true, true, true, true,
                       true, true, true, true, true, true, true, true,
                       true, true, true, true, true, true, true, true
     };
     long val = 0;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += micro(inp, i&3);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 700000 ; i++)
       val += micro(inp, i&3);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
