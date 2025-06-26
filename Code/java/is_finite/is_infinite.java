
import java.util.Random;
import java.util.Arrays;
import java.util.stream.IntStream;

public class is_infinite {
  public static void micro(boolean [] dst, float [] src) {
     for (int i = 0 ; i < dst.length; i++) {
        dst[i] = Float.isInfinite(src[i]);
     }
  }

  public static void main(String [] args) {
     Random r = new Random(1024);
     boolean [] dst = new boolean[1024];
     float [] arr   = new float[1024];

     IntStream.range(0, arr.length).forEach(i -> arr[i] = r.nextFloat());
     for (int i = 0; i < 100000; i++) {
        micro(dst, arr);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 100000; i++) {
        micro(dst, arr);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + "ms [res]" + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
  }
}
