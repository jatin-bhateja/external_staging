

import java.util.Arrays;
import java.util.stream.*;

public class stress_reg {
   public static long micro1(long a, long b, long c, long d, long e, long f) {
      long t1 = a + b;
      long t2 = a - b * 10;
      long t3 = a * b;

      long t5 = c + d;
      long t6 = c - d * 10;
      long t7 = c * d;

      long t9  = e + f;
      long t10 = e - f * 10;
      long t11 = e * f;
    
      long t12 = t1 + t2;
      long t13 = t1 - t2 * 10;
      long t14 = t1 * t2;

      long t15 = t5 + t6;
      long t16 = t5 - t6 * 10;
      long t17 = t5 * t6;

      long t19 = t9 + t10;
      long t20 = t9 - t10 * 10;
      long t21 = t9 * t10;

      return a + b + c + d + e + f + t1 * t2 + t3 * t5  +  t6 * t7 + t9 * t10 + t11 + t12 << t13 + t14 << t15 + t16 << t17 + t19 << t20 + t20 << t21;
   }

   public static void main (String [] args) {
      long res = 0;
      long [] arr = IntStream.range(0, 506).mapToLong( i -> (long) i + 10).toArray();
      for (int iter = 0; iter < 3000; iter++) {
         for (int i = 0; i < 500; i++) {
            res += micro1(arr[i], arr[i+1], arr[i+2], arr[i+3], arr[i+4], arr[i+5]);
         }
      } 
      res = 0;
      long t1 = System.currentTimeMillis();
      for (int iter = 0; iter < 3000; iter++) {
         for (int i = 0; i < 500; i++) {
            res += micro1(arr[i], arr[i+1], arr[i+2], arr[i+3], arr[i+4], arr[i+5]);
         }
      } 
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms   [res] " + res);
   }
}
