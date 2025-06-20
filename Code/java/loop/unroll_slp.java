
import java.util.stream.IntStream;

public class unroll_slp {
   public static int micro(int [] dst, int [] src1, int [] src2, int ctr) {
      for (int i = 0; i < dst.length; i++) {
         dst[i] = src1[i] + src2[i];
      }
      return dst[ctr];
   }

   public static void main(String [] args) {
      int res = 0;
      int [] src1 = IntStream.range(0, 1024).toArray();
      int [] src2 = IntStream.range(0, 1024).toArray();
      int [] dst = new int[1024];
      for (int i = 0; i < 10000; i++) {
          res += micro(dst, src1, src2, i & 511);
      }
      System.out.println("[res]  " + res);
   }
}
