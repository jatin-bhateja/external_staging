
public class intArray {
   public static Integer [] iarr1;
   public static Integer [] iarr2;
   public static Integer [] res;
   public static final int SIZE = 256;
   public static final int SIZE_M1 = SIZE - 1;

   public static int micro(int ctr) {
      iarr1 = new Integer [SIZE];       // ANEWARRAY
      iarr2 = new Integer [SIZE];       // ANEWARRAY
      res   = new Integer [SIZE];       // ANEWARRAY
      for (int i = 0; i < iarr1.length; i++) {
         iarr1[i] = new Integer(i);     // AASTORE
         iarr2[i] = new Integer(i * 2); // AASTORE
      }
      for (int i = 0; i < res.length; i++) {
         res[i] = iarr1[i].intValue() + iarr2[i].intValue(); 
      }
      return res[ctr].intValue();   
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i & SIZE_M1);
      }
      System.out.println("[res] " + res);
   }
}
