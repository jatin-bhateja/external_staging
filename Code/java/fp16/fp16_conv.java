
import java.util.Arrays;
import java.util.stream.IntStream;

public class fp16_conv {
   public static void micro(long [] dst, short [] src) {
       for (int i = 0; i < dst.length; i++) {
           dst[i] = Float16.valueOf(src[i]).longValue();
       }
   }
   public static void main(String [] args) {
       short [] src = new short[1024];
       long  [] dst = new long[1024];
       IntStream.range(0, 1024).forEach(i -> { src[i] = Float.floatToFloat16((float)i); }); 
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 100000; i++) {
          micro(dst, src); 
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2 - t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
