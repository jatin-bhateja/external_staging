
import jdk.incubator.vector.*;
import java.util.Arrays;

public class castopt {
  public static final VectorSpecies<Long> L512 = LongVector.SPECIES_512;
  public static final VectorSpecies<Double> D512 = DoubleVector.SPECIES_512;

  public static long micro1(double [] arr, int idx) {
     long l = 0; 
     for(int i = 0; i < D512.loopBound(arr.length); i += D512.length()) {
        DoubleVector vec = DoubleVector.fromArray(D512, arr, i);
        l += vec.convertShape(VectorOperators.D2L, L512, 0).reinterpretAsLongs().lane(idx);
     }
     return l;
  }

  public static long micro2(double [] arr, int idx) {
     long l = 0; 
     for(int i = 0; i < D512.loopBound(arr.length); i += D512.length()) {
        DoubleVector vec = DoubleVector.fromArray(D512, arr, i);
        l += vec.viewAsIntegralLanes().lane(idx);
     }
     return l;
  }

  public static void main(String [] args) {
     int size = Integer.parseInt(args[0]);
     int algo = Integer.parseInt(args[1]);
     assert size > 0 && ((size & size -1) == 0);
     double [] arr = new double[size];
     Arrays.fill(arr, Double.MAX_VALUE);
     long res = 0;
     if (algo == 0) {
        for(int i = 0; i < 100000; i++) {
           res += micro1(arr, i & 7);
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++) {
           res += micro1(arr, i & 7);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Cast Time] " + (t2-t1) +  " ms  [Res] " + res);
     } else {
        for(int i = 0; i < 100000; i++) {
           res += micro2(arr, i & 7);
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++) {
           res += micro2(arr, i & 7);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ViewAsILanes Time] " + (t2-t1) +  " ms  [Res] " + res);
     }
  }
}
