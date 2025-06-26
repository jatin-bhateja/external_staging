
import java.util.Random;
import java.util.stream.IntStream;

public class test_reduction_pref {
    public static Random rd = new Random(1023);

    public static int micro1(int [] src) {
         int res1 = Integer.MAX_VALUE;
         int res2 = Integer.MIN_VALUE;
         for (int i = 0; i < src.length; i++) {
             // Reductions always agnostic to precision : Float.max, Float.min 
             // Reductions enabled under fast-math : Float.add, Float.mul.
             // Integral reductions: Add, Mul, Min, Max

             // Cost of Reduction : LoadVector, Reduction Tree (D&C), log2(n) levels for n lane vector.
             // 256 bit vector
             // V1 = LoadVector <256> src  
             // V1H<128> = V1.HI
             // V2 = V1 + V1H
             // V3 = V1(128) + V1H(128)
             // V4 = V3L(64)  + V3H(64)
             // V5 = V4L(32) + V4H(32)
             //
             // Savings: Memory operations.
             // Each Scalar Memory Read takes 3 cycles - L1D access latency.
             // Lesser number of memory uops.
             // Processor resources - uop-cahe(FE), DSB(FE), RS(BE), ROB(BE) ,RAT (RE) etc save additional entries 
             
             // Q. When is reduction now useful ?
             // A. There are two aspects to reduction, one which touches the memory sub-system, load / stores.
             //    Second, compute - instruction needed to perform reduction. In some cases like FP Addtion, 
             //    as JVM specification impost strict ordering constraints on evaluation of the expression due
             //    to strict precision requirements.
             //    In such case, even though with reductions we can optimize memory sub-system access,
             //    but ordering constraints leaves a little headroom for optimizing the instruction sequence.

             res1 = Integer.min(res1, src[i]);
             res2 = Integer.max(res2, src[i]);
         }
         return res1 + res2;
    }

    public static float micro2(float [] src) {
         float res1 = Float.MAX_VALUE;
         float res2 = Float.MIN_VALUE;
         for (int i = 0; i < src.length; i++) {
             res1 = Math.min(res1, src[i]);
             res2 = Math.max(res2, src[i]);
         }
         return res1 + res2;
    }

    public static float micro3(float [] src) {
         float res1 = 0.0f;
         float res2 = 0.1f;
         for (int i = 0; i < src.length; i++) {
             res1 = Math.fma(src[i], src[i], res1);
             res2 = Math.fma(src[i], src[i], res2);
         }
         return res1 + res2;
    }

    public static float micro4(float [] src) {
         float res1 = 0.0f;
         float res2 = 0.1f;
         for (int i = 0; i < src.length; i++) {
             res1 = res1 + src[i];
             res2 = res2 + src[i];
         }
         return res1 + res2;
    }

    public static int micro5(int [] src) {
         int res1 = 0;
         int res2 = 0;
         for (int i = 0; i < src.length; i++) {
             res1 = res1 + src[i];
             res2 = res2 + src[i];
         }
         return res1 + res2;
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);

        int res1 = 0;
        float res2 = 0;
        int [] src1 = IntStream.range(0, 2048).map(i -> -i).toArray();
        float [] src2 = new float[2048];
        IntStream.range(0, 2048).forEach(i -> {src2[i] = rd.nextFloat();});

        if (algo == 0) {         
          for (int i = 0; i < 1000000; i++) {
            res1 += micro1(src1); 
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
            res1 += micro1(src1); 
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms  [res] " + res1);
        } else if (algo == 1) {
          for (int i = 0; i < 1000000; i++) {
            res2 += micro2(src2); 
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
            res2 += micro2(src2); 
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + res2);
        } else if (algo == 2) {
          for (int i = 0; i < 1000000; i++) {
            res2 += micro3(src2); 
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
            res2 += micro3(src2); 
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + res2);
        } else if (algo == 3) {
          for (int i = 0; i < 1000000; i++) {
            res2 += micro4(src2); 
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
            res2 += micro4(src2); 
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + res2);
        } else if (algo == 4) {
          for (int i = 0; i < 1000000; i++) {
            res1 += micro5(src1); 
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
            res1 += micro5(src1); 
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + res1);
        }
    }
}
