import jdk.incubator.vector.*;
import java.util.Arrays;

public class double_non_zero {
  public static final int size = 4096;
  public static VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
  public static double micro(double[] src1, double[] src2, double[] dst, int ctr) {
     for(int i = 0; i < SPECIES.loopBound(dst.length); i += SPECIES.length()) {
        DoubleVector vsrc1 = DoubleVector.fromArray(SPECIES, src1, i);
        DoubleVector vsrc2 = DoubleVector.fromArray(SPECIES, src2, i);
        vsrc1.lanewise(VectorOperators.FIRST_NONZERO, vsrc2)
            .intoArray(dst, i);
     }
     return dst[ctr];
  }
  public static void main(String [] args) {
     double res = 0.0;     
     double [] src1 = new double[size];
     double [] src2 = new double[size];
     double [] dst = new double[size];
     Arrays.fill(src1, 0.0);
     Arrays.fill(src2, 1.0);
     System.arraycopy(src1, 0, src2, 0, size/2);
     for(int i = 0; i < 100000; i++) {
        res += micro(src1, src2, dst, i & (size-1));
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 100000; i++) {
        res += micro(src1, src2, dst, i & (size-1));
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Res]  " + res  + "  [Time]  " + (t2-t1) + " ms ");
  }
}
