
import java.util.Arrays;

public class float16_mainline_add {
  public static short sum(short a, short b) {
    return (short)Float.float16ToFloat(Float.floatToFloat16(Float.float16ToFloat(a) + Float.float16ToFloat(b)));
  }
  public static void micro(short [] r, short [] a, short [] b) {
    for (int i = 0; i < a.length; i++) {
      r[i] = sum(a[i], b[i]);
    }
  }

  public static void main (String [] args) {
    short [] res = new short[1024];
    short [] src1 = new short[1024];
    short [] src2 = new short[1024];
    Arrays.fill(src1, (short)1);
    Arrays.fill(src2, (short)2);
    for (int i = 0;i < 100000; i++) {
      micro(res, src1, src2);
    }
    System.out.println("[res] " + res[3]);
  }
}
