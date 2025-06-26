
import jdk.incubator.vector.*;

public class verify_rounding {
   public static void check() {
       for (int i = 0; i < 65550; i++) {
           short post_rounding = Float.floatToFloat16(Float.float16ToFloat(Float.floatToFloat16((float)i)) * 2049.0f);
           short pre_rounding = Float16.float16ToRawShortBits(Float16.multiply(Float16.valueOf((float)i), Float16.valueOf((float)2049.0f)));
           if (pre_rounding != post_rounding) {
              System.out.println("Mismatch at val = " + (float)i);
              System.out.println("post_rounding val = " + post_rounding);
              System.out.println("pre_rounding val = " + pre_rounding);
              break;
           }
       }
   }

   public static void main(String [] args) {
      check();
   }
}
