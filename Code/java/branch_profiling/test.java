

public class test {
   public static int micro(int cond, int a, int b, int c) {
       if (cond > 5000 && cond < 10000) {
          return a * b;          
       } else {
          return b + c;
       }
   }
 
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0 ; i < 20000; i++) {
          res += micro(i, 10, 20, 30);
       }
       System.out.println("[res] " + res);
   }
}
