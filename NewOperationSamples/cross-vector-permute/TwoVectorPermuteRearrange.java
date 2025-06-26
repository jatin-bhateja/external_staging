
import jdk.incubator.vector.*;
import java.util.Arrays;

public class TwoVectorPermuteRearrange {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;

   public static void micro(float [] res, float [] src, int [] shuf) {
       for (int i = 0; i < res.length; i += FSP.length()) {
            FloatVector.fromArray(FSP, res, i)
                       .rearrange(VectorShuffle.fromArray(FSP, shuf, i),
                             FloatVector.fromArray(FSP, src, i))
                       .intoArray(res, i);
       }
   }

   public static void main (String [] args) {
       float [] res = new float[4096];
       for (int i = 0; i < res.length; i++) {
          res[i] = (float)i;
       }
       float [] orig = Arrays.copyOf(res, res.length);
       float [] src = new float[4096];
       for (int i = 0; i < src.length; i++) {
          src[i] = (float)i + src.length;
       }
       int [] shuf = new int[4096];
       for (int i = 0; i < shuf.length; i++) {
          shuf[i] = i*2;
       }
       for (int i = 0; i < 10000; i++) {
           System.arraycopy(orig, 0, res, 0, res.length);
           micro(res, src, shuf);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 50000; i++) {
           System.arraycopy(orig, 0, res, 0, res.length);
           micro(res, src, shuf);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, FSP.length()))); 
   }
}
