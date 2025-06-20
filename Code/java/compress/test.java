

public class test {
   public static int micro(int src, int mask) {
       src = Integer.max(Integer.min(7, src), -7);
       return Integer.compress(src, mask);
   } 

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(-1, -1);
       }
       System.out.println("[res]" + res);
   }
}
