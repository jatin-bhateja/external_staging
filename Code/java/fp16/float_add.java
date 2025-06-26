
import java.util.Arrays;

public class float_add {

  public static Float micro(Float a, Float b) {
     Float r1 = Float.valueOf(a.floatValue() + b.floatValue());
     return Float.valueOf(r1.floatValue() + b.floatValue());
  }

  public static void main (String [] args) {
    float [] res = new float[1024];
    Float [] src1 = new Float[1024];
    Float [] src2 = new Float[1024];
    for (int i = 0; i < src1.length; i++) {
      src1[i] = Float.valueOf((float)i);
      src2[i] = Float.valueOf((float)i);
    }
    for (int i = 0;i < 20000; i++) {
      int idx = i & 1023;
      res[idx] = micro(src1[idx], src2[idx]).floatValue();
    }
    System.out.println("[res] " + res[3]);
  }
}
