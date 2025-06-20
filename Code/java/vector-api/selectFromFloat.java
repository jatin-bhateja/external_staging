
import jdk.incubator.vector.*;
import java.util.Arrays;

public class selectFromFloat {

  public static final VectorSpecies<Float> SP = FloatVector.SPECIES_256;

  public static void micro(float [] dst, float [] src1, float [] src2) {
      FloatVector.fromArray(SP, dst, 0)
                   .selectFrom(FloatVector.fromArray(SP, src1, 0),
                               FloatVector.fromArray(SP, src2, 0))
                   .intoArray(dst, 0);
  }

  public static void main(String [] args) {
     float [] dst = new float[8];
     float [] vals = {0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30};
     float [] src1 = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f, 11.0f, 12.0f, 13.0f, 14.0f, 15.0f, 16.0f};
     float [] src2 = {10.0f, 20.0f, 30.0f, 40.0f, 50.0f, 60.0f, 70.0f, 80.0f, 90.0f, 100.0f, 110.0f, 120.0f, 130.0f, 140.0f, 150.0f, 160.0f};

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
     System.out.println("[time] " + (t2-t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0 , 8)));
  }
}
