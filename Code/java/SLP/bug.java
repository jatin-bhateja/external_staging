class bug {
 public static int   [] iArr;
 public static float [] fArr;

 static void test1() {
     for (int i = 4; i < 100; i++) { 
         fArr[i + 4] = fArr[i];
     } 
 }

 public static void main(String [] args) {
     float res = 0.0f;
     iArr = new int[2048];
     fArr = new float[2048];
     for(int i = 0; i < 10000; i++) {
         test1();
         res += fArr[i & 127]; 
     }
     System.out.println("res = " + res);   
 }
}

/*
   Notes:
   - A: LoadI, alignment of first access w.r.t best ref StoreF= 0
   - B: StoreI, alias_idx_type = [I, alignment of first access w.r.t best ref StoreF = 0
   - C: StoreF, alias_idx_type = [F, alignment of first access w.r.t best ref StoreF = 0
   Both the stores belongs to separate memory slices, since alignment of all the memory 
   references comply hence SLP vectorizes this loop.

   If we modify test1 as follows by removing floating point cast operation and make iArr[i] as integral array, then
   all the stores share same alias index corresponding to alias type [I and belongs to same memory slice.

   public static int [] fArr;
   static void test1() {
       for (int i = 4; i < 100; i++) { 
           int v = iArr[i];          // A.  
           iArr[i + 2] = v;          // B. Forward writing at least 2 -> cyclic dependency 
           fArr[i] = iArr[i]; // C. Seems required. 
       } 
   }
   
   In this case, StoreI corresponding to statement B is mis-aligned w.r.t. best ref StoreF and has alignment 8.
   Thus first StoreI node for statement B and C have different alignment, this will prevent vectorizing statement B, however A and C will still
   vectorize since alignment of there starting references comply.

   Solution:
   Alignment of mismatched access with same lane width should also comply w.r.t best ref chosen for alignment, so adjusted alignment of first reference
   of statement B in original case should be 8. This will enable downstream stage in SLP to filter out all the store corresponding
   to statement B to be vectorized.   
*/
