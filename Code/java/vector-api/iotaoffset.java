

import jdk.incubator.vector.*;

class test {
   public static final int len = 8;
   public static int [] arr;

   public static void workload(int [] arr) {
     Vector.Shuffle<Integer> IS = IntVector.shuffleOffset(IntVector.SPECIES_256, -2);
     IS.intoArray(arr, 0);
   }

   public static void main(String [] args) {
      arr = new int[len];
      for (int i = 0 ; i < 100000; i++) 
        workload(arr);
      for (int i = 0 ; i < len ; i++)
        System.out.println(" " + arr[i]);
   }
}
