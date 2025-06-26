
primitive class ABC {
   static int field;
   public ABC() {
   }
}

public class emptyFlatArray {
   public static ABC [] farr;
   public static final int SIZE = 16;
   public static final int SIZE_M1 = SIZE - 1;

   public static int micro(int ctr) {
      farr = new ABC[SIZE];     // ANEWARRAY
      for (int i = 0; i < farr.length; i++) {
          farr[i] = new ABC();  // AASTORE
      }
      farr[ctr].field = 10;
      return farr[ctr].field;   
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i & SIZE_M1);
      }
      System.out.println("[res] " + res);
   }
}
