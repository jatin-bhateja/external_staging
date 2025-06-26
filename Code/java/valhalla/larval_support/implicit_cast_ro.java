
import jdk.internal.misc.Unsafe;

interface dummy_interface {
   double micro(double [] values);
}


public value class implicit_cast_ro implements dummy_interface {

    static final long[] OFFSETS = new long[] { 16, 24 };

    public double micro(double [] values) {
        return Arrays.hashCode(values); 
    }

    public static double test(dummy_interface caller, double[] values) {
        implicit_cast_ro obj = new implicit_cast_ro();
        obj =  Unsafe.getUnsafe().makePrivateBuffer(obj);
        return obj.micro(values);
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

