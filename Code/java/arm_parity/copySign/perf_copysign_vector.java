
import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class perf_copysign_vector {
    public static  void micro(double [] res, double [] mag, double [] sign) {
       for (int i = 0; i < mag.length; i++) {
           res[i] = Math.copySign(mag[i], sign[i]);
       }
    }

    public static void main(String [] args) {
       double [] mag = new double[1024];
       double [] sign = new double[1024];
       double [] res = new double[1024];
       Random r = new Random(1023);
       IntStream.range(0, mag.length).forEach(i -> { mag[i] = r.nextDouble(); });
       IntStream.range(0, sign.length).forEach(i -> { sign[i] = r.nextDouble(); });

       for (int i = 0; i < 1000000; i++) {
           micro(res, mag, sign);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 1000000; i++) {
           micro(res, mag, sign);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2  - t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
    }
}
