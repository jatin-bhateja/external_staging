

import jdk.incubator.vector.*;

class test {
   public static final int len = 32;
   public static int [] arr;

   public static void workload0(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(0,1,false);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }
   public static void workload1(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(1,1,false);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }

   public static void workload2(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(0,2,false);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }
   public static void workload3(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(1,2,false);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }
   public static void workload4(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(0,1,true);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }
   public static void workload5(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(1,8,true);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }

   public static void workload6(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(0,2,true);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }
   public static void workload7(int [] arr) {
     var BS = IntVector.SPECIES_256.iotaShuffle(1,2,true);
     ((IntVector)BS.toVector()).intoArray(arr,0);
   }

   public static void printRes(int [] arr) {
      for (int i = 0 ; i < IntVector.SPECIES_256.length(); i++)
        System.out.println(" " + arr[i]);
   }

   public static void main(String [] args) {
      arr = new int[32];
      long t1,t2;

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload0(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload0(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 0 , Scale = 1 , Wrap = false :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload1(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload1(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 1 , Scale = 1 , Wrap = false :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload2(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload2(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 0 , Scale = 7 , Wrap = false :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload3(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload3(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 1 , Scale = 8 , Wrap = false :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload4(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload4(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 0 , Scale = 1 , Wrap = true :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload5(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload5(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 1 , Scale = 1 , Wrap = true :"+ (t2-t1)/100 + " us");
      printRes(arr);


      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload6(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload6(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 0 , Scale = 7 , Wrap = true :"+ (t2-t1)/100 + " us");
      printRes(arr);

      // Warmup
      for (int i = 0 ; i < 900000; i++) 
        workload7(arr);
      t1 = System.nanoTime();
      for (int i = 0 ; i < 100000; i++) 
        workload7(arr);
      t2 = System.nanoTime();
      System.out.println("[Time] Start = 1 , Scale = 8 , Wrap = true :"+ (t2-t1)/100 + " us");
      printRes(arr);
   }
}
