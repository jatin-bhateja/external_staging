
import java.util.stream.IntStream;
import static jdk.incubator.vector.Float16.*;
//import jdk.internal.math.*;

public class vecAddFP16 {
  public static final int SIZE = 8192;
  public static final int SIZE_M1 = SIZE - 1;

  public static float micro0(short [] dst, short [] src1, short [] src2, int ctr) {
     for (int i = 0; i < dst.length; i++) {
        dst[i] = float16ToRawShortBits(max(shortBitsToFloat16(src1[i]), shortBitsToFloat16(Float.floatToFloat16(1.0f))));
     }
     return Float.float16ToFloat(dst[ctr]);
  }

  public static float micro1(short [] dst, short [] src1, short [] src2, int ctr) {
     for (int i = 0; i < dst.length; i++) {
        dst[i] = float16ToRawShortBits(max(shortBitsToFloat16(Float.floatToFloat16(2.0f)), shortBitsToFloat16(Float.floatToFloat16(1.0f))));
     }
     return Float.float16ToFloat(dst[ctr]);
  }

  public static float micro2(short [] dst, short [] src1, short [] src2, int ctr) {
     for (int i = 0; i < dst.length; i++) {
        dst[i] = float16ToRawShortBits(max(shortBitsToFloat16(src1[i]), shortBitsToFloat16(src2[i])));
     }
     return Float.float16ToFloat(dst[ctr]);
  }
  public static void main(String [] args) {
     float res = 0.0f;
     short [] src1 = new short[SIZE];
     short [] src2 = new short[SIZE];
     short [] dst = new short[SIZE];
     IntStream.range(0, SIZE).forEach(i -> {src1[i] = Float.floatToFloat16((float)i);});
     IntStream.range(0, SIZE).forEach(i -> {src1[i] = Float.floatToFloat16((float)i);});

     for (int i = 0; i< 20000; i++) {
         res += micro2(dst, src1, src2, i & SIZE_M1);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i< 20000; i++) {
         res += micro2(dst, src1, src2, i & SIZE_M1);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
  }
}
