
import jdk.incubator.vector.*;
import java.util.Arrays;

public class TwoVectorPermuteBug1 {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;

   public static void micro(float [] res, float [] shuf, float [] src1, float [] src2) {
       VectorShuffle<Float> vshuf = FloatVector.fromArray(FSP, shuf, 0).toShuffle();
       VectorShuffle<Float> vshuf_wrapped = vshuf.wrapIndexes();
       FloatVector.fromArray(FSP, src1, 0)
         .rearrange(vshuf_wrapped)
         .blend(FloatVector.fromArray(FSP, src2, 0)
                           .rearrange(vshuf_wrapped),
                           vshuf.laneIsValid().not())
         .intoArray(res, 0);
   }

   public static void main(String [] args) {
       float [] res  = new float[FSP.length()];
       float [] shuf = new float[FSP.length()];
       float [] src1 = new float[FSP.length()];
       float [] src2 = new float[FSP.length()];
       for (int i = 0; i < FSP.length(); i++) {
           shuf[i] = i * 2;
       }
       for (int i = 0; i < FSP.length(); i++) {
           src1[i] = i;
           src2[i] = i + FSP.length(); 
       }
       for (int i = 0; i < 50000; i++) {
           micro(res, shuf, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 50000; i++) {
           micro(res, shuf, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
   }
}  
