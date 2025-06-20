import java.util.Arrays;
import jdk.incubator.vector.*;

public class alias_vapi {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_512;
   public static float micro(float [] src1, float [] src2) {
  // public static float micro(float [] res2, float [] res1, float [] src1, float [] src2) {
  // Same iteration space, loop combining + removal of redundant res1 loads.

       // Stores are not re-ordered with respect to previous stores.
       float [] res1 = new float[17];
       float [] res2 = new float[17];
     
       res1[0] = src1[0] + src2[0];
       FloatVector.fromArray(FSP, src1, 1)
                  .lanewise(VectorOperators.ADD, FloatVector.fromArray(FSP, src2, 1))
                  .intoArray(res1, 1);

       // LoadVector ===> Vector Graph ===> StoreVector
       /*for(int i = 0; i < 17; i++) {
          res1[i] = src1[i] + src2[i];
          // Store order in fully unrolled loop: res1[0], res1[1].....res1[1023]
       }*/
     
       res2[0] = src1[0] * src2[0];
       FloatVector.fromArray(FSP, res1, 1)
                  .lanewise(VectorOperators.MUL, FloatVector.fromArray(FSP, src2, 1))
                  .intoArray(res2, 1);
       
       /*for(int i = 0; i < 17; i++) {
          res2[i] = src1[i] * src2[i];
          // Store order in fully unrolled loop: res2[0], res2[1].....res2[1023]
       }*/
     
       // Vectorization should not break the memory ordering effect.
     
       // Combining two loop bodies and generating vectorized stores will 
       // interleave the vectorized stores across the iterations, thus violating
       // memory ordering, which expects all res1 stores should retire
       // prior to res2 stores.
     
       // Even during  auto-vectorization C2 ensures to consult memory depedence along with
       // data-dependency while scheduling packs, this is done to ensure that there
       // no memory ordering violation.

       // From user's prespective, ordering is only relevant in context of share
       // accesses, but incoming array arguments may point to a shared memory.
     
       // LoadFNode (Alias [F)
       return res1[3] + res2[3];
   }
   public static void main(String [] args) {
      float [] res1 = new float[1024];
      float [] res2 = new float[1024];
      float [] src1 = new float[1024];
      float [] src2 = new float[1024];
      Arrays.fill(src1, 10.0f); 
      Arrays.fill(src2, 20.0f); 
      float val = 0.0f;
      for (int i = 0; i < 10000; i++) {
          //val += micro(res2, res1, src1, src2);
          val += micro(src1, src2);
      } 
      System.out.println("[res] " + val);
   }
}

