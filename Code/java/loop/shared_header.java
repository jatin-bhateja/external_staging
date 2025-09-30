
public class shared_header {

   public static int micro(int cond, int a, int b, int c, int d, int e, int f, int g) {
       int t1 = 1000;
       int t2 = 2000;
       int t3 = 2000;
       int res = 0;
       for (int i = 0; i < 10000; i++) {
           t1 += a + b * c;
           t2 += d / e;
           if (i > cond) {                 // CmpI -> Bool
              res += t1 * t2;
              continue;
           }
           // Phi [res:0] [
           t3 += f & g;
           res += t3 * 10000;
       }
       return res;
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(5000, i, i+20, i+30, i+40, i+50, i+60, i+70);
       }
       System.out.println("[res] " + res);
   } 
}


