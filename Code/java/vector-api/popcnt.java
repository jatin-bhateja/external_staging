
import java.util.Arrays;

public class popcnt {
   public static final int SIZE = 4096;
   public static void micro(int [] dst, long [] src) {
      for(int i = 0; i < src.length; i++) {
         dst[i] = Long.bitCount(src[i]);
      }
   }
   public static void main(String [] args) {
      long [] src = new long[SIZE];
      int  [] dst = new int[SIZE];
      Arrays.fill(src, 10);
      for(int i = 0; i < 10000; i++) {
          micro(dst, src);
      }
      int res = 0;
      for (int i = 0; i < dst.length; i++) {
         res += Integer.bitCount(dst[i]);
      }
      System.out.println("[res] " + res); 
   }
}
