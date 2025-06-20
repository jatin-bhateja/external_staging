
import java.util.Arrays;

class BField {
   public static boolean f1 = true;
}

public class boolbcast {
   public static void micro (boolean [] dst, boolean [] src) {
       Arrays.fill(src, BField.f1);
       for (int i = 0; i < dst.length; i++) {
          dst[i] = src[i];
       }
   }
   public static void main(String [] args) {
       boolean [] src = new boolean[4096];
       boolean [] dst = new boolean[4096];
       for (int i = 0; i < 10000; i++) {
          micro(dst, src);
       }
       System.out.println(Arrays.toString(Arrays.copyOfRange(dst, 0, 64)));
   }
}
