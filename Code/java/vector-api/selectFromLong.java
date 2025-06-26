
import jdk.incubator.vector.*;
import java.util.Arrays;

public class selectFromLong {

  public static final VectorSpecies<Long> SP = LongVector.SPECIES_256;

  public static void micro(long [] dst, long [] src1, long [] src2) {
      LongVector.fromArray(SP, dst, 0)
                   .selectFrom(LongVector.fromArray(SP, src1, 0),
                               LongVector.fromArray(SP, src2, 0))
                   .intoArray(dst, 0);
  }

  public static void main(String [] args) {
     long [] dst = new long[8];
     long [] vals = {0, 2, 4, 6, 8, 10, 12, 14};
     long [] src1 = {10, 20, 30, 40, 50, 60, 70, 80};
     long [] src2 = {100, 200, 300, 400, 500, 600, 700, 800};

     for (int i = 0; i < 10000; i++) {
        System.arraycopy(vals, 0, dst, 0, 8);
        micro(dst, src1, src2);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 10000; i++) {
        System.arraycopy(vals, 0, dst, 0, 8);
        micro(dst, src1, src2);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0 , 4)));
  }
}
