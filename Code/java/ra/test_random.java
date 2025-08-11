
public class test_random {

   public static int micro(int i1, int i2, int i3, int i4, int i5, int i6) {
      return i1 * i2 + i3 / i4 ^ i5 & i6; 
   } 
 
   public static void main(String [] args) {
      int res = 0;
      for (int i = 1; i < 1000000; i++) {
          res += micro(i, i + 1, i + 2, i + 3, i + 4, i + 5);
      }
      System.out.println("[res] " + res);
   }
}
