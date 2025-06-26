
import java.util.stream.IntStream;
import java.util.concurrent.ThreadLocalRandom;
import net.jafama.FastMath;

interface Micro {
   public double apply(double argument);
}

class Micro1 implements Micro {
   public double apply(double argument) {
      return Math.tanh(argument);
   }
}

class Micro2 implements Micro {
   public double apply(double argument) {
      return FastMath.tanh(argument);
   }
}

public class perf_tanh {
   public static void main(String [] args) {
       int size = Integer.parseInt(args[0]);
       int algo = Integer.parseInt(args[1]);

       Micro bm = null;
       if (algo == 1) {
          bm = new Micro1();
       } else if (algo == 2) {
          bm = new Micro2();
       }
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
