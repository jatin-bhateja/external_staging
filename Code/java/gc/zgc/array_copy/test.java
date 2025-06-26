
import java.util.stream.IntStream;

public class test {
   public static void micro(Object [] dst, Object [] src) {
      System.arraycopy(src, 0, dst, 0, dst.length);
   }

   public static void main(String [] args) {
      int size = Integer.parseInt(args[0]);
      Object [] src = new Object[size];
      Object [] dst = new Object[size];

      IntStream.range(0, size).forEach(i -> src[i] = Integer.valueOf(i));
      for (int i = 0; i < 100000; i++) {
          micro(dst, src);
      } 
      System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
