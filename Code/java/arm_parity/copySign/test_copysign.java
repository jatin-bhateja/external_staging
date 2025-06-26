
import java.util.Random;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test_copysign {
    public static float micro(float mag, float sign) {
       return Math.copySign(mag, sign);
    } 
    public static void main(String [] args) {
       float [] mag = new float[11004];
       float [] sign = new float[11004];
       float [] res = new float[11004];
       Random r = new Random(1023);
       IntStream.range(0, mag.length).forEach(i -> { mag[i] =  7.6911607E37f;});
       IntStream.range(0, sign.length).forEach(i -> { sign[i] =   -5.773534E37f;});
       for (int i = 0; i < 10000; i++) {
          for (int j = 0 ; j < mag.length; j++) {
             res[j] = micro(mag[j], sign[j]);
          }
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 10000; i++) {
          for (int j = 0 ; j < mag.length; j++) {
             res[j] = micro(mag[j], sign[j]);
          }
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2  - t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 11000, 11004)));
    }
}
