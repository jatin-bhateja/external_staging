
import java.util.Arrays;

public class loop_invariant {
   public static void micro(double [] dst, double val) {
      for (int i = 0; i < dst.length; i++) {
          double value1 = Math.sqrt(val); // loop invariant
          double value2 = Math.sqrt((double)i);
          dst[i] = value1 + value2;
      }
   }
   public static void main(String [] args) {
      double [] dst = new double[1024];
      for (int i = 0; i < 10000; i++) {
          micro(dst, 10.0);
      }
      System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
