

import jdk.incubator.vector.*;

class nan {
   public static float [] arr;
   public static VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

   public static int workload(float [] arr) {
     int res = 0;
     for(int i = 0 ; i < arr.length ; i+= SPECIES.length()) {
        FloatVector FV = FloatVector.fromArray(SPECIES, arr, i);
        res += FV.test(VectorOperators.IS_DEFAULT).allTrue() == true ? 1 : 0;
     }
     return res;
   }

   public static void main(String [] args) {
      int Res = 0;
      arr = new float[256];
      for (int i = 0 ; i < 100000; i++) 
         Res += workload(arr);
      System.out.println("Res = " + Res);
   }
}
