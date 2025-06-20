

public class test {
   public static long micro(long a, long b) {
       long t = a & 0xF;
       if (t > 0xF) {
          // Dead block and not UCT.
          return a % b;
       }
       return t;
   }

   public static void main(String [] args) {
       long res = 0;
       for (int i = 0; i < 100000; i++) {
          res += micro(i, i - 10);
       }
       System.out.println("[res] " + res);
   }
}
