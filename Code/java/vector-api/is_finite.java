
import jdk.incubator.vector.*;
import java.util.Random;
import java.util.Arrays;

public class is_finite {
  public static final VectorSpecies<Float> F64 = FloatVector.SPECIES_256;
  public static void micro(boolean [] arr, float [] farr, int index) {
     FloatVector.fromArray(F64, farr, index)
                .test(VectorOperators.IS_FINITE)
                .intoArray(arr, index);
  }

  public static void main (String [] args) {
     Random ra = new Random(1034);
     float [] farr = new float[1024];
     boolean [] barr = new boolean[1024];
     for (int i = 0; i < farr.length; i++) {
         farr[i] = ra.nextFloat();
     }
     farr[512] = Float.POSITIVE_INFINITY;
     farr[1023] = Float.POSITIVE_INFINITY;
     for (int i = 0; i < 10000; i+=F64.length()) {
         micro(barr, farr, i&1023);
     }
     System.out.println(Arrays.toString(barr)); 
  }
}
