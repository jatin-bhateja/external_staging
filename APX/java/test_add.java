public class test_add {
   public static int micro(int a, int b, int c) {
       int t = a + 10;
       if (t > 10000) {
           return c;
       } else {
           return b + 10;
       }
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 20000; i++) {
           res += micro(i, i + 1, i + 2); 
       }
       System.out.println("[res] " + res); 
   } 
}
