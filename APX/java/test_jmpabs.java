
import java.util.Arrays;
import java.util.stream.IntStream;

public class test_jmpabs {
   public static void micro(int [] dst, int [] src, int length) {
      System.arraycopy(src, 0, dst, 0, length);
   }

   public static void main(String [] args) {
      int [] src = IntStream.range(0, 1024).toArray();
      int [] dst = new int[1024];
      for (int i = 0; i < 100000; i++) {
         micro(dst, src, 1024);
      }
      System.out.println("dst[16:0] = " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16))); 
   }
}
