
import java.util.stream.IntStream;
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

       Micro bm = null;
       bm = new Micro1();
       assert bm != null;

       double [] vector = new double[size];
       IntStream.range(0, size).forEach(i -> { vector[i] = ThreadLocalRandom.current().nextDouble(Double.MIN_VALUE, Double.MAX_VALUE); });

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
