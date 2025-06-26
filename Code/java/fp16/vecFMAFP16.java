
import static jdk.incubator.vector.Float16.*;

public class vecFMAFP16 {
  public static final int SIZE = 8192;
  public static final int SIZE_M1 = SIZE - 1;
  public static short SCALAR_FP16 = (short)0x7777;

  public static float micro(short [] dst, short [] src, int ctr) {
     // Loop Invariant , shared across unrolled bodies, so matcher will always find a shared node during labelling which will match
     // against shared register.
     for (int i = 0; i < src.length; i++) {
        dst[i] = float16ToRawShortBits(fma(shortBitsToFloat16(dst[i]), shortBitsToFloat16(src[i]), shortBitsToFloat16(SCALAR_FP16)));
        dst[i] = float16ToRawShortBits(fma(shortBitsToFloat16(dst[i]), shortBitsToFloat16(src[i]), shortBitsToFloat16((short)0x7777)));
     }
     return Float.float16ToFloat(dst[ctr]);
  }

  public static void main(String [] args) {
     float res = 0.0f;
     short [] src = new short[SIZE];
     short [] dst = new short[SIZE];
     for (int i = 0; i < src.length; i++) {
        src[i] = Float.floatToFloat16((float)1.0f);
        dst[i] = Float.floatToFloat16((float)2.0f);
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
