
import jdk.incubator.vector.*;

class test {
   private static final int LEN = 15;
   private static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   private static final boolean mask_vec_512[][] = {
      {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},
      {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true},
      {false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true},
      {false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true},
      {false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true},
      {false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true},
      {false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, true},
      {false, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true},
      {false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true},
      {false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true},
      {false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true},
      {false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true},
      {false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, true},
      {false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true},
      {false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true},
      {false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true},
   };

   private static final boolean mask_vec_256[][] = {
      {false, false, false, false, false, false, false, false},
      {false, false, false, false, false, false, false, true},
      {false, false, false, false, false, false, true, true},
      {false, false, false, false, false, true, true, true},
      {false, false, false, false, true, true, true, true},
      {false, false, false, true, true, true, true, true},
      {false, false, true, true, true, true, true, true},
      {false, true, true, true, true, true, true, true},
   };

   private static final boolean mask_vec_128[][] = {
      {false, false, false, false},
      {false, false, false, true},
      {false, false, true, true},
      {false, true, true, true},
   };

   private static final boolean mask_vec [][] = mask_vec_256;

   public static void printres(int [] res) {
      for(int i = 0; i < res.length ; i++)
         System.out.println("res["+ i +"] = " + res[i]);
   }

   public static void initArr(int [] arr) {
     for (int i = 0; i < LEN ; i++)
        arr[i] = i; 
   }

   public static int getTripCount(int [] arr) {
     return arr.length - (arr.length & (SPECIES.length() - 1));
   }

   public static int getTailCount(int [] arr) {
     return arr.length & (SPECIES.length() - 1);
   }

   public static void workload1(int [] res, int [] arr, int TRIP_COUNT, int TAIL_COUNT) {  
      int i = 0;
      initArr(arr);
      for(i = 0; i < TRIP_COUNT; i += SPECIES.length()) {
          IntVector IVEC = IntVector.fromArray(SPECIES, arr, i);
          IVEC = IVEC.add(IVEC);
          IVEC = IVEC.add(IVEC);
          IVEC = IVEC.add(IVEC);
          IVEC = IVEC.add(IVEC);
          IntVector RVEC  = IVEC;
          RVEC.intoArray(res,i);
      }    

      // Tail loop   
      int TCNT = arr.length - TAIL_COUNT;
      for (i = TCNT ; i < arr.length; i++) {
        arr[i] += arr[i]; 
        arr[i] += arr[i]; 
        arr[i] += arr[i]; 
        arr[i] += arr[i]; 
        res[i] = arr[i]; 
      } 
   }

   public static void workload2(int [] res, int [] arr, int TRIP_COUNT, int TAIL_COUNT) {  
      int i = 0;
      initArr(arr);
      for(i = 0; i < TRIP_COUNT; i += SPECIES.length()) {
        IntVector IVEC = IntVector.fromArray(SPECIES, arr, i);
        IVEC = IVEC.add(IVEC);
        IVEC = IVEC.add(IVEC);
        IVEC = IVEC.add(IVEC);
        IVEC = IVEC.add(IVEC);
        IntVector RVEC  = IVEC;
        RVEC.intoArray(res,i);
      }    

      // Tail loop 
      IntVector TVEC = IntVector.fromArray(SPECIES, arr, arr.length - SPECIES.length());
      VectorMask<Integer> MASK = VectorMask.fromArray(SPECIES, mask_vec[TAIL_COUNT], 0);

      // Extra loop iteration
      TVEC = TVEC.add(TVEC);
      TVEC = TVEC.add(TVEC);
      TVEC = TVEC.add(TVEC);
      TVEC = TVEC.add(TVEC);
      IntVector RVEC  = TVEC;

      IntVector LAST_TILE = IntVector.fromArray(SPECIES, res, res.length - SPECIES.length());
      LAST_TILE.blend(RVEC, MASK).intoArray(res, res.length - SPECIES.length());
   }

   public static void main(String [] args) {
     int [] arr = new int[LEN];
     int [] res = new int[LEN];

     int TRIP_COUNT = getTripCount(arr);
     int TAIL_COUNT = getTailCount(arr);

     System.out.println("TRIP_COUNT = " + TRIP_COUNT + " TAIL_COUNT = " + TAIL_COUNT);

     // Warmup iteration.
     for (int i = 0; i < 700000; i++)
       workload1(res, arr, TRIP_COUNT, TAIL_COUNT); 

     long t1  = System.currentTimeMillis();
     for (int i = 0; i < 100000 ; i++)
       workload1(res, arr, TRIP_COUNT, TAIL_COUNT); 
     long t2  = System.currentTimeMillis();
     System.out.println("Workload1 = " + (t2-t1));
     printres(res);

     // Warmup iteration.
     for (int i = 0; i < 700000 ; i++)
        workload2(res, arr, TRIP_COUNT, TAIL_COUNT); 

     t1  = System.currentTimeMillis();
     for (int i = 0; i < 100000 ; i++)
       workload2(res, arr, TRIP_COUNT, TAIL_COUNT); 
     t2  = System.currentTimeMillis();
     System.out.println("Workload2 = " + (t2-t1));
     printres(res);
   }
}
