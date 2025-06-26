
import java.util.Random;
import java.util.Arrays;
import java.util.stream.IntStream;

public class is_finiteD {
  public static void micro(boolean [] dst, double [] src) {
     for (int i = 0 ; i < dst.length; i++) {
        dst[i] = Double.isFinite(src[i]);
     }
  }

  public static void main(String [] args) {
     Random r = new Random(1024);
     boolean [] dst = new boolean[1024];
     double [] arr   = new double[1024];

     IntStream.range(0, arr.length).forEach(i -> arr[i] = r.nextDouble());
     for (int i = 0; i < 1000000; i++) {
        micro(dst, arr);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 1000000; i++) {
        micro(dst, arr);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + "ms [res]" + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
  }
}
