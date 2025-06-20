
import jdk.incubator.vector.*;

class firsttrue {
  public static VectorSpecies<Short> SPECIES = ShortVector.SPECIES_64;
 
  public static int micro(boolean [] inp, int [] out, int ctr) {
    for (int i  = 0 , j = 0; i < SPECIES.loopBound(inp.length); i+=SPECIES.length()) {
       VectorMask<Short> mask1 = SPECIES.loadMask(inp, i);
       out[j++] = mask1.firstTrue();
    }
    return out[ctr&(out.length-1)];
  }

  public static void main(String [] args) {
     long val = 0;
     boolean [] inp = new boolean[1024];
     int [] out = new int[1024/SPECIES.length()];

     for(int i = 0 ; i < inp.length; i++) {
       inp[i] = (i & 1) != 0;
     }

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += micro(inp, out, i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += micro(inp, out, i);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
