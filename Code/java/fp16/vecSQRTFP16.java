
import static jdk.incubator.vector.Float16.*;

public class vecSQRTFP16 {
  public static final int SIZE = 8192;
  public static final int SIZE_M1 = SIZE - 1;

  public static float micro(short [] dst, short [] src, int ctr) {
     for (int i = 0; i < src.length; i++) {
        dst[i] = float16ToRawShortBits(sqrt(shortBitsToFloat16(src[i])));
     }
     return Float.float16ToFloat(dst[ctr]);
  }

  public static void main(String [] args) {
     float res = 0.0f;
     short [] src = new short[SIZE];
     short [] dst = new short[SIZE];
     for (int i = 0; i < src.length; i++) {
        src[i] = Float.floatToFloat16(1.0f);
     }
     for (int i = 0; i< 20000; i++) {
         res += micro(dst, src, i & SIZE_M1);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i< 20000; i++) {
         res += micro(dst, src, i & SIZE_M1);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
  }
}
