
import jdk.incubator.vector.*;
import java.util.Arrays;

public class acos {
  public static final int INVOC_COUNT = 1;
  public static final int ARRAY_LEN = 1024;
  public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

  static void ACOSFloat256VectorTests(float [] a, float [] r) {
    for (int ic = 0; ic < INVOC_COUNT; ic++) {
      for (int i = 0; i < a.length; i += SPECIES.length()) {
        FloatVector av = FloatVector.fromArray(SPECIES, a, i);
        av.lanewise(VectorOperators.ACOS).intoArray(r, i);
      }
    }
 }

 public static void main(String [] args) {
   float [] a = new float[ARRAY_LEN];
   float [] r = new float[ARRAY_LEN];
   Arrays.fill(a, 1.0f); 
   for (int i = 0 ; i < 10000; i++) {
     ACOSFloat256VectorTests(a, r);
   }
 }
}
