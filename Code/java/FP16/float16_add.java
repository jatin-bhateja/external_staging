

import java.util.Arrays;

public class float16_add {
  public static void micro(float [] r, Float16 [] a, Float16 [] b) {
    for (int i = 0; i < a.length; i++) {
      r[i] = Float16.add(a[i], b[i]).floatValue();
    }
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
      micro(res, src1, src2);
    }
    System.out.println("[res] " + res[3]);
  }
}
