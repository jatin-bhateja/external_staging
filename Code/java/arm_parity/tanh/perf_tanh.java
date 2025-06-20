import java.util.stream.IntStream;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

interface Micro {
   public double apply(double argument);
}

class Micro1 implements Micro {
   public double apply(double argument) {
      return Math.tanh(argument);
   }
}

public class perf_tanh {
   public static void main(String [] args) {
       int size = Integer.parseInt(args[0]);
       int algo = Integer.parseInt(args[1]);
       Random rd = new Random(1024);

       Micro bm = new Micro1();

       double [] vector = new double[size];
       // Performance valdation for various value ranges.
          // Analyze the curve and c-code for various fast path scenarios.
          // Analyze java implimentation and identify fact path scenarios.
       IntStream.range(0, size).forEach(i -> { vector[i] = rd.nextDouble(-1000.0, 1000.0); });

       double res = 0.0;
       for (int iter = 0; iter < 10000; iter++) {
           for (int i = 0; i < size; i++) {
              res += bm.apply(vector[i]);
           }
       }

       long t1 = System.currentTimeMillis();
       for (int iter = 0; iter < 10000; iter++) {
           for (int i = 0; i < size; i++) {
              res += bm.apply(vector[i]);
           }
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2 - t1) + " ms  [res] " + Double.doubleToLongBits(res));
   }
}
