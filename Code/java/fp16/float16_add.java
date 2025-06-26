
import java.util.Arrays;
import jdk.incubator.vector.*;

public class float16_add {

  public static Float16 micro(Float16 a, Float16 b) {
     Float16 r1 = Float16.fma(a, b, a);
     return Float16.fma(r1, a, b);
  }

  public static void main (String [] args) {
    float [] res = new float[1024];
    Float16 [] src1 = new Float16[1024];
    Float16 [] src2 = new Float16[1024];
    for (int i = 0; i < src1.length; i++) {
      src1[i] = Float16.valueOf((short)1);
      src2[i] = Float16.valueOf((short)1);
    }
    for (int i = 0;i < 20000; i++) {
      int idx = i & 1023;
      res[idx] = micro(src1[idx], src2[idx]).floatValue();
    }
    System.out.println("[res] " + res[3]);
  }
}
