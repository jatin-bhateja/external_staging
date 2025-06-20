
import java.util.stream.*;
import java.util.Arrays;

public class test_rotate_long_av {
   public static void micro1(long [] res, long [] src, int [] shift) {
       for (int i = 0; i < res.length; i++) {
          // VTransform intermediate IR should inject CastI2X (T_LONG)
          // while committing transform to enable auto-vectorization of
          // long rotates with variable shifts.
          res[i] = Long.rotateRight(src[i], shift[i]);
       }
   }

   public static void micro2(long [] res, long [] src, int shift) {
       for (int i = 0; i < res.length; i++) {
          res[i] = Long.rotateRight(src[i], shift);
       }
   }

   public static void micro3(long [] res, long [] src) {
       for (int i = 0; i < res.length; i++) {
          res[i] = Long.rotateRight(src[i], 7);
       }
   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       int shift_scalar = Integer.parseInt(args[1]);

       long [] res = new long[1024];
       long [] src = LongStream.range(0, 1024).toArray();
       int [] shift = IntStream.range(0, 1024).toArray();
   
       if (algo == 0) {
          for (int i = 0 ; i < 100000; i++) {
             micro1(res, src, shift);
          }
       } else if (algo == 1) {
          for (int i = 0 ; i < 100000; i++) {
             micro2(res, src, shift_scalar);
          }
       } else if (algo == 2) {
          for (int i = 0 ; i < 100000; i++) {
             micro3(res, src);
          }
       }
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16))); 
   }
}
