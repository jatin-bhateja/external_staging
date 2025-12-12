
class sigined_unsigned_divide {

   public static long unsigned_div(long val) {
     return Long.divideUnsigned(val, 512);
   }

   public static long signed_div(long val) {
     return val / 512;
   }

   public static void main(String [] args) {
      long res = 0;
      for(int i = 0 ; i < 10000000; i++) {
         res += unsigned_div((long)i);
      }
      res = 0;
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000000; i++) {
         res += unsigned_div((long)i);
      }
      long time = System.currentTimeMillis() - t1;
      System.out.println("[Time] " + time + " ms   [Res] " + res);
   }
}
