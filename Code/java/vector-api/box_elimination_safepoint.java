

import java.util.Arrays;
import jdk.incubator.vector.*;

public class box_elimination_safepoint {
   public static float micro (float [] arr, int cond) {
      FloatVector vec = FloatVector.fromArray(FloatVector.SPECIES_256, arr, 0);
      if (cond < 40) {
         // UCT
         return vec.lane(0);
      }
      return vec.lane(1);
   }

   public static void main(String [] args) {
      float [] arr = new float[8];
      Arrays.fill(arr, 1.0f);
      float res = 0.0f;
      for (int i = 0; i <  10000; i++) {
          res +=  micro(arr, i);
      }
      System.out.println(res);
   }
}
