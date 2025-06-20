

import java.util.Arrays;
import jdk.incubator.vector.*;

public class box_elimination_safepoint {
   public static void leaf(float [] arr) {
      Arrays.fill(arr, 2.0f);
   }
   public static float micro (float [] arr ) {
      FloatVector vec = FloatVector.fromArray(FloatVector.SPECIES_256, arr, 0);
      leaf(arr);
      return vec.lane(1);
   }

   public static void main(String [] args) {
      float [] arr = new float[8];
      Arrays.fill(arr, 1.0f);
      float res = 0.0f;
      for (int i = 0; i <  10000; i++) {
          res +=  micro(arr);
      }
      System.out.println(res);
   }
}
