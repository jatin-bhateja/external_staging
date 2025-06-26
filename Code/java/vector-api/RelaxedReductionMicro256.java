
import jdk.incubator.vector.*;

public class RelaxedReductionMicro256 {

   public static final VectorSpecies<Float> F256 = FloatVector.SPECIES_256;

   public static final VectorShuffle<Float> upper_lane4To8 = VectorShuffle.iota(F256, 4, 1, true);
   public static final VectorShuffle<Float> upper_lane2To4 = VectorShuffle.iota(F256, 2, 1, true);
   public static final VectorShuffle<Float> upper_lane1To2 = VectorShuffle.iota(F256, 1, 1, true);

   public static float myRelaxedReduceAdd(float [] arr) {
       var vec1 = FloatVector.fromArray(F256, arr, 0);
       var vec2 = vec1.add(vec1.rearrange(upper_lane4To8));
       var vec3 = vec2.add(vec2.rearrange(upper_lane2To4));
       return vec3.add(vec3.lane(1)).lane(0);
   }

   public static float reduceAdd(float [] arr) {
       return FloatVector.fromArray(F256, arr, 0)
                  .reduceLanes(VectorOperators.ADD);
   }

   public static void main (String [] args) {
       int algo = Integer.parseInt(args[0]);
       float res = 0.0f;
       float [] arr = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
       if (algo == 0 || algo == -1) {
          for (int i = 0; i < 5000000; i++) {
              res += myRelaxedReduceAdd(arr);
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
              res += myRelaxedReduceAdd(arr);
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
       } 
       if (algo == 1 || algo == -1) {
          res = 0; 
          for (int i = 0; i < 5000000; i++) {
              res += reduceAdd(arr);
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 1000000; i++) {
              res += reduceAdd(arr);
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
       }
   }
}

