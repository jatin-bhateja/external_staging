
import jdk.incubator.vector.*;
import org.testng.Assert;

class icmp {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
  public static final int INVOC_COUNT = 100;

  public static int workload(int [] a, int [] b, boolean [] mask, int ctr) {
     int ret = 0;
     for (int ic = 0; ic < INVOC_COUNT; ic++) {
        for (int i = 0; i < a.length; i += SPECIES.length()) {
           IntVector av = IntVector.fromArray(SPECIES, a, i);
           IntVector bv = IntVector.fromArray(SPECIES, b, i);
           VectorMask<Integer> mv = av.eq(bv);

           // Check results as part of computation.
           for (int j = 0; j < SPECIES.length(); j++) {
               if (mv.laneIsSet(j) != (a[i + j] == b[i + j])) {
                 System.out.println(mv);
                 System.out.println(av);
                 System.out.println(bv);
               }
               Assert.assertEquals(mv.laneIsSet(j), a[i + j] == b[i + j]);
           }
           ret += mv.laneIsSet(ctr & (mask.length-1)) ? 1 :0;
         }
     }
     return ret;
  }

  public static void main(String [] args) {
     int res = 0;
     int [] arr1 = new int[128];
     int [] arr2 = new int[128];
     boolean [] mask_arr = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};

     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = i - 2;
       arr2[i] = i - 2;
     }
     for (int i = 0 ; i < 100000 ; i++) {
       res += workload(arr1, arr2, mask_arr, i);
     }

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 10000 ; i++) {
       res += workload(arr1, arr2, mask_arr, i);
     }
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time + " Res = " + res);
  }
}
