
import jdk.incubator.vector.*;
import java.util.Arrays;

public class ShuffleFloat {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;
   // VectorShuffle.fromArray
   public static void micro1(float [] res, float [] src1, int [] indices) {
      FloatVector.fromArray(FSP, src1, 0)
                 .rearrange(VectorShuffle.fromArray(FSP, indices, 0))
                 .intoArray(res, 0);
   }
   // VectorShuffle.shuffleIota
   public static void micro2(float [] res, float [] src1, int start, int step, boolean wrap) {
      FloatVector.fromArray(FSP, src1, 0)
                 .rearrange(FSP.iotaShuffle(start, step, wrap))
                 .intoArray(res, 0);
   }
   // Vector.selectFrom 
   public static void micro3(float [] res, float [] src1, float [] indices) {
      FloatVector.fromArray(FSP, indices, 0)
                 .selectFrom(FloatVector.fromArray(FSP, src1, 0))
                 .intoArray(res, 0);
   }

   public static void main(String [] args) {
      int start = 7;
      int step  = -1;
      boolean wrap = true;
      float [] res = new float[8];
      int   [] iindices = {7,6,5,4,3,2,1,0};
      float [] findices = {7.0f, 6.0f, 5.0f, 4.0f, 3.0f, 2.0f, 1.0f, 0.0f};
      float [] src1 = {100.0f, 200.0f, 300.0f, 400.0f, 500.0f, 600.0f, 700.0f, 800.0f};

      int micro = Integer.parseInt(args[0]);
      if (micro == 0 || micro == -1) {
         for (int i = 0; i < 1000000; i++) {
            micro1(res, src1, iindices);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 1000000; i++) {
            micro1(res, src1, iindices);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro1] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
      }

      if (micro == 1 || micro == -1) {
         for (int i = 0; i < 1000000; i++) {
            micro2(res, src1, start, step, wrap);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 1000000; i++) {
            micro2(res, src1, start, step, wrap);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro2] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
      }

      if (micro == 2 || micro == -1) {
         for (int i = 0; i < 1000000; i++) {
            micro3(res, src1, findices);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 1000000; i++) {
            micro3(res, src1, findices);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro3] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
      }
   } 
} 
