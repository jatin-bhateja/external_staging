
import jdk.incubator.vector.*;

class compare {
  public static VectorSpecies<Short> SPECIES = ShortVector.SPECIES_64;
  public static void workload(short [] a , short [] b) {
      for (int i = 0 ; i < SPECIES.loopBound(a.length); i+= SPECIES.length()) { 
        var IV1 = ShortVector.fromArray(SPECIES, a, i);
        var IV2 = ShortVector.fromArray(SPECIES, b, i);
        VectorMask Res = IV1.lt(IV2);
        for(int j = 0; j < SPECIES.length(); j++) {
           assert Res.laneIsSet(j) == true;
        }
     }
  }

  public static void main(String [] args) {
     short [] arr1 = new short[1024];
     short [] arr2 = new short[1024];

     for (int i = 0 ; i < arr1.length ; i++) {
        arr1[i] = (short)i;
        arr2[i] = (short)i;
     }
  
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr1, arr2);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr1, arr2);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);
  }
}
