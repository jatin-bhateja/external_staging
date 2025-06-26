
import java.util.Arrays;
import jdk.incubator.vector.*;

public class extract {
  public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
  
  public static float micro (float [] arr) {
     float res  = 0.0f;
     FloatVector FV = FloatVector.fromArray(SPECIES, arr, 0);
     for (int i = 0; i < SPECIES.length(); i++) {
         res += FV.lane(i);
     }
     return res;
  }

  public static void main(String [] args) {
     float res = 0.0f;
     float [] arr = new float[SPECIES.length()];
     Arrays.fill(arr, 10.0f);
     for (int i = 0; i < 10000; i++) {
        res += micro(arr);
     }
     System.out.println("[res] " + res);
  }
}
