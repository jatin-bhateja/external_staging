
import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class convertD2X {
    public static final VectorSpecies<Double> DSP = DoubleVector.SPECIES_256;

    public static void micro(long [] dst, double [] src, int idx) {
       DoubleVector.fromArray(DSP, src, idx)
                   .convert(VectorOperators.D2L, 0)
                   .reinterpretAsLongs()
                   .intoArray(dst, idx);
    }

    public static void main(String [] args) {
       double [] src = IntStream.range(0, 1024).mapToDouble(i -> i * 10).toArray();
       long [] dst = new long[1024];
       for (int ic = 0; ic < 100; ic++) {
           for (int i = 0; i < DSP.loopBound(dst.length); i += DSP.length()) {
               micro(dst, src, i);
           }
       }
       long t1 = System.currentTimeMillis();
       for (int ic = 0; ic < 5000; ic++) {
           for (int i = 0; i < DSP.loopBound(dst.length); i += DSP.length()) {
               micro(dst, src, i);
           }
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + "ms [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
    }
}
