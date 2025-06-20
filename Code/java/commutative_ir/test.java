public class test {
   public static long micro (long a, long b, long c) {
      long t1 = a + b;
      long t2 = b + a;
      return t1 * t2;
   }
 
   public static void main(String [] args) {
      long res = 0;
      for (int i = 0; i < 10000; i++) {
         res += micro(i, i + 10, i + 20);
      }
      System.out.println("[res] " +  res);
   }
}
