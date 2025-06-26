
primitive class ABC {
   int field;
   public ABC(int field) {
      this.field = field;
   }
}

public class flatMatrix {
   public static ABC [][] farr;
   public static final int SIZE = 16;
   public static final int SIZE_M1 = SIZE - 1;

   // Similar to primitive 2D arrays, memory layout contiguity is only 
   // applicable to consecutive row elements, not consecutive rows.
   // A 2D arrays is an array of arrays. Each row is a single dimensional
   // array, first dimension elements are references to single dimensional
   // arrays.
   public static int micro(int ctr) {
      farr = new ABC [SIZE][SIZE];    // MULTIANEWARRAY
      for (int i = 0; i < farr.length; i++) {
          farr[i] = new ABC[SIZE]; // ANEWARRAY
          for (int j = 0; j < farr[i].length; j++) {
              farr[i][j] = new ABC(i + j); // AASTORE
          }
      }
      return farr[ctr][ctr].field;   
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i & SIZE_M1);
      }
      System.out.println("[res] " + res);
   }
}
