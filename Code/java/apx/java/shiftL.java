

public class shiftL {
   public static int micro(int d1, int d2, int d3 ,int d4, int d5 , int d6, int val, int shift) {
       return val << shift + val << (d1 + d2 + d3 + d4 + d5 + d6);
   }
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(1, 2, 3, 4, 5, 6, i, i);
       }
       System.out.println("[res] " + res);
   }
} 
