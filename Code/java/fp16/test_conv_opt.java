
import java.util.stream.IntStream;

public class test_conv_opt {
  public static short micro(float src1, float src2, boolean cond) {
      return cond ? Float.floatToFloat16(src1) : Float.floatToFloat16(src2);
  }
  public static void main(String [] args) {
      float [] src1 = new float[1024];
      float [] src2 = new float[1024];
      IntStream.range(0, 1024).forEach(
        i -> {
           src1[i] = 1.0f;
           src2[i] = 2.0f;
        }
      );
      short res = 0;
      for (int ic = 0; ic < 10000; ic++) {
          for (int i = 0; i < 1024; i++) {
              res += micro(src1[i], src2[i], i < 512);
          }
      }
      System.out.println("[res]" + res);
  }
}
