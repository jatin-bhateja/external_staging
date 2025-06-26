
import jdk.incubator.vector.*;

class div {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
  public static int workload(int [] arr1, int [] arr2, int [] res, int ctr, VectorMask<Integer> mask) {
     IntVector vec1 = IntVector.fromArray(SPECIES, arr1, 0);
     IntVector vec2 = IntVector.fromArray(SPECIES, arr2, 0);
     vec1.lanewise(VectorOperators.DIV, vec2)
      .intoArray(res,0);
    return res[0]; 
  }

  public static void main(String [] args) {
     int val = 0;
     int [] arr1 = new int[128];
     int [] arr2 = new int[128];
     int [] res = new int[128];
     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = (int)(-5);
       arr2[i] = (int)(-5);
     }

     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 15);

     // Warmup
     for (int i = 0 ; i < 7000000 ; i++)
       val += workload(arr1, arr2, res, i & (res.length-1), mask);

     val = 0;
     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 1000000 ; i++)
       val += workload(arr1, arr2, res, i & (res.length-1), mask);
     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] " + time + "ms [Res] " + val);
     for(int i = 0 ; i < SPECIES.length() ; i++) {
       System.out.println("res[" + i + "] " + res[i]);
     }
  }
}
