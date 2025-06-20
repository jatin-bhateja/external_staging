

public class HW {
   public static int micro(int d1, int d2, int d3, int d4, int d5, int d6, String msg1, String msg2) {
       System.out.println(msg1 + msg2);
       return d1 + d2*d3;
   }
   public static void main(String [] args) {
      int res = micro(1, 2, 3, 4, 5, 6, "Hello", "World");
      System.out.print(res);
   }
}
