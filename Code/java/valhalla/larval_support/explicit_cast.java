
import jdk.internal.misc.Unsafe;

abstract class AbstractPair { } 

value class Pair extends AbstractPair {
    double d1, d2;
    public Pair(double d1, double d2) {
        this.d1 = d1;
        this.d2 = d2;
    }
}

public class explicit_cast {

    static final long[] OFFSETS = new long[] { 16, 24 };

    public static Pair micro(Pair a) {
        Unsafe.getUnsafe().putDouble(a, 16, 20.0);
        return Unsafe.getUnsafe().finishPrivateBuffer(a);
    }

    public static double test(double[] values) {
        Pair p  = new Pair(values[0], values[1]);
        p = Unsafe.getUnsafe().makePrivateBuffer(p);
        p = micro(p);
        return p.d1 + p.d2;
    }

    public static void main(String[] args) {
        double[] values = new double[] { 1.0, 2.0 };
        double d = 0.0;
        for (int i = 0; i < 10000; i++) {
            d = test(values);
        }
        System.out.printf("test: %f\n", d);
    }
}

