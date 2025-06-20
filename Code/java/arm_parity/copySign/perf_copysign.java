
import java.util.Random;
import java.util.stream.IntStream;

public class perf_copysign {
    public static double micro(double mag, double sign) {
       
       return Math.copySign(mag, sign) + 3.5;
    } 
    public static void main(String [] args) {
       double [] arr = new double[11004];
       double res = 0.0;
       Random r = new Random(1023);
       IntStream.range(0, arr.length).forEach(i -> { arr[i] = r.nextDouble(-Double.MAX_VALUE, Double.MAX_VALUE); });
       for (int i = 0; i < 10000; i++) {
          for (int j = 0 ; j < arr.length - 1; j++) {
             res += micro(arr[j], arr[j+1]);
          }
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 10000; i++) {
          for (int j = 0 ; j < arr.length - 1; j++) {
             res += micro(arr[j], arr[j+1]);
          }
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2  - t1) + " ms  [res] " + res);
    }
}
