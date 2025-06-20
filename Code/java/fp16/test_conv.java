
import java.util.Arrays;
import static java.lang.Float16.*;

public class test_conv {
  public static final int LEN  = 1024;

  public static void micro(float [] dst, short [] src1, short [] src2) {
      for (int i = 0; i < dst.length; i++) {
         dst[i] = Float.float16ToFloat(float16ToRawShortBits(Float16.add(shortBitsToFloat16(src1[i]), shortBitsToFloat16(src2[i]))));
      }
  }

  public static void main(String [] args) {
      float [] dst = new float[LEN];
      short [] src1 = new short[LEN];
      short [] src2 = new short[LEN];
      for (int i = 0; i < LEN; i++) {
         src1[i] = Float.floatToFloat16((float)i);
         src2[i] = Float.floatToFloat16((float)i);
      }
      for (int i = 0; i < 100000; i++) {
         micro(dst, src1, src2);
      }
      System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
  }
}
