
import jdk.incubator.vector.*;

public class test_float16 {
   public static void micro(short [] res, float [] src1, float [] src2) {
      for (int i = 0; i < res.length; i++) {
         res[i] = Float16.float16ToRawShortBits(Float16.add(Float16.valueOf(src1[i]), Float16.valueOf(1.0f)));
      }
   }

   public static void main (String [] args) {
      float [] src1 = new float[1024];
      float [] src2 = new float[1024];
      short [] res = new short[1024];
      java.util.stream.IntStream.range(0, 1024).forEach(
          i -> {
              src1[i] = (float)i;
              src2[i] = (float)i;
          }
      );
      for (int i = 0; i < 100000; i++) {
          micro(res, src1, src2);
      }
      System.out.println("[res] " + java.util.Arrays.toString(java.util.Arrays.copyOfRange(res, 0, 16)));
   }
}
