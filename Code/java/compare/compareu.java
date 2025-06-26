
public class compareu {
  public static  int micro (int a, int b) {
      return Integer.compareUnsigned(a, b);
  } 
  public static void main (String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i , i *100000);
      }
      System.out.println("[res] " + res);
  }
}
