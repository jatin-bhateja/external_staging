
import jdk.internal.misc.Unsafe;

public class unsafe_bug {
     primitive class Pair {
         final double d1, d2;
         public Pair(double d1, double d2) {
             this.d1 = d1;
             this.d2 = d2;
         }
     }

     static final long[] OFFSETS = new long[] { 16, 24 };

     public static Pair helper(double[] values, boolean[] mask) {
         Pair p = Unsafe.getUnsafe().makePrivateBuffer(Pair.default);

         for (int i = 0; i < OFFSETS.length; i++) {
             if (mask[i]) {
                 Unsafe.getUnsafe().putDouble(p, OFFSETS[i], values[i]);
             }
         }
         return Unsafe.getUnsafe().finishPrivateBuffer(p);
    }


    public static double test(double[] values, boolean[] mask) {
         Pair p = helper(values, mask);
         return p.d1 + p.d2;
    }

    public static void main(String[] args) {
        double[] values = new double[] { 1.0, 2.0 };
        boolean[] mask = new boolean[] { true, false };

        double d = 0.0;
        for (int i = 0; i < 10000; i++) {
            d = test(values, mask);
        }
        System.out.printf("test: %f\n", d);
     }
}

