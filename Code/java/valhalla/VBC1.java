

class VBC1 {
   public static int [] arr1;
   public static int [] arr2;
   public static int [] res;
   public static void setup() {
      arr1 = new int[1024];
      arr2 = new int[1024];
      res = new int[1024];
      for (int i = 0; i < 1024; i++) {
         arr1[i] = 10000 + i;
         arr2[i] = 10000 + i;
      }
   }
   public static int accum(int ctr) {
      for (int i = 0; i < 1024; i++) {
          res[i] = arr1[i] + arr2[i];
      }
      return res[ctr];
   }
   public static void main(String [] args) {
      long res = 0;
      setup();
      for (int i = 0; i < 100000; i++) {
         res += accum(i & 1023);
      }
      System.out.println("[res] " + res);
   }
}
