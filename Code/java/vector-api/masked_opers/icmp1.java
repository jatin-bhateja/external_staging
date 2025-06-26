
import jdk.incubator.vector.*;
//import org.testng.Assert;

class icmp {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

  public static int workload(int [] arr1, int [] arr2, int [] res, int ctr) {
      int ret = 0;
      boolean [] mask_arr = {true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false};
      VectorMask mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      for (int i = 0 ; i < arr1.length; i+= SPECIES.length()) {
        IntVector vec1 = IntVector.fromArray(SPECIES, arr1, i);
        IntVector vec2 = IntVector.fromArray(SPECIES, arr2, i);
        VectorMask vcmp = vec1.compare(VectorOperators.GT, vec2, mask);
        ret  = vcmp.laneIsSet(ctr & (SPECIES.length() - 1)) ? 1 : 0;
      }
      return ret;
  }

  public static void main(String [] args) {
     int ret = 0;
     int [] arr1 = new int[16];
     int [] arr2 = new int[16];
     int [] res = new int[16];
     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = i;
       arr2[i] = i - 2;
     }

     try {
       VectorMask val = null;
       // Warmup
       for (int i = 0 ; i < 700000 ; i++) {
         ret += workload(arr1, arr2, res, i);
       }
       // Perf
       long start = System.currentTimeMillis();
       for (int i = 0 ; i < 100000 ; i++) {
         ret += workload(arr1, arr2, res, i);
       }
       long time = System.currentTimeMillis() - start;
       System.out.println("Time = " + time + " Res = " + ret);
       for(int i = 0 ; i < val.length() ; i++) {
         System.out.println("M[" +i + "] = " + val.laneIsSet(i));
       }
     } catch(Exception e) {
       System.out.println(e);
     }  
  }
}
