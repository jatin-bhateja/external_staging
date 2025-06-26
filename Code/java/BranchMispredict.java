public class BranchMispredict {
   public static int micro(int i) {
       if (i > 50000) {
          return (int)Math.sqrt((float)i) + Integer.max(i, 10000);
       } else {
          return i * i + i >> 30 + 10000;
       }
   }
   public static void main(String [] args) {
       int res = 0;
       for(int i = 0 ; i < 50000; i++) {
           res += micro(i);
       }
       System.out.println(res);
   }
}
