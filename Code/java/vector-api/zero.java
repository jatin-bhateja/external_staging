

import jdk.incubator.vector.*;

class test {
   public final VectorSpecies SPECIES;
   public static float [] arr;

   public void workload(float [] arr) {
     FloatVector IV = FloatVector.zero(SPECIES);
     IV.intoArray(arr, 0);
   }
   
   public test() {
      SPECIES = FloatVector.SPECIES_256; 
   }

   public static void main(String [] args) {
      test obj = new test();
      arr = new float[8];
      for (int i = 0 ; i < 100000; i++) 
        obj.workload(arr);
      for (int i = 0 ; i < 8 ; i++)
        System.out.println(" " + arr[i]);
   }
}
