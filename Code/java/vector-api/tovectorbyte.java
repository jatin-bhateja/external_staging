

import jdk.incubator.vector.*;

class test {
   public static final int len = 32;
   public static byte [] arr;

   public static void workload(byte [] arr) {
     var BV = ByteVector.SPECIES_MAX.iotaShuffle(0,1,true);
     ((ByteVector)BV.toVector()).intoArray(arr,0);
   }

   public static void main(String [] args) {
      arr = new byte[len];
      for (int i = 0 ; i < 100000; i++) 
        workload(arr);
      for (int i = 0 ; i < len ; i++)
        System.out.println(" " + arr[i]);
   }
}
