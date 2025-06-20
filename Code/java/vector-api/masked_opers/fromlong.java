
import jdk.incubator.vector.*;

class fromlong {
  public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

  public static long micro1(long val, boolean [] res, int ctr) {
    VectorMask<Float> mask1 = VectorMask.fromLong(SPECIES, val);
    mask1.intoArray(res, 0);
    return res[ctr] ? 1L : 0L;
  }

/*
  public static VectorMask<Float> micro2(VectorMask mask) {
    long val = mask.toLong();
    return VectorMask.fromLong(SPECIES, val);
  }
*/

  public static void main(String [] args) {
     boolean [] inp = {
       true, true, true, true, true, true, true, true, 
       true, true, true, true, true, true, true, true,
       true, true, true, true, true, true, true, true,
       true, true, true, true, true, true, true, true
     };

     long val = 0;
/*
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += micro1(-1);

     val = 0;
     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 1000000 ; i++)
       val += micro1(-1);
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
*/

///*
     // Perf
     boolean [] arr = new boolean[SPECIES.length()];
     //VectorMask vmask = VectorMask.fromLong(SPECIES, val);
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 700000 ; i++) {
       //vmask = VectorMask.fromLong(SPECIES, val);
       val += micro1((long)i , arr, (i & (SPECIES.length()-1)));
     }
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
//*/
  }
}
