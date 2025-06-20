
import java.util.Arrays;

public class float16_neg {
  public static void micro(Float16[] r, Float16 [] a) {
    for (int i = 0; i < a.length; i++) {
      r[i] = Float16.negate(a[i]);
    }
  }

  public static void main (String [] args) {
    Float16 [] res = new Float16[1024];
    Float16 [] src = new Float16[1024];
    for (int i = 0; i < src.length; i++) {
      src[i] = Float16.valueOf((short)i);
    }
    for (int i = 0;i < 20000; i++) {
      micro(res, src);
    }
    long t1 = System.currentTimeMillis();
    for (int i = 0;i < 20000; i++) {
      micro(res, src);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + " ms  [res] " + res[3]);
  }
}
