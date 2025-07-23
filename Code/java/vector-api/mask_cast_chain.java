
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class mask_cast_chain {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_128;

   public static long micro(float [] src1, float [] src2, int ctr) {
       long res = 0;
       for (int i = 0; i < FSP.loopBound(src1.length); i += FSP.length()) {
            res += FloatVector.fromArray(FSP, src1, i)
                         .compare(VectorOperators.GE, FloatVector.fromArray(FSP, src2, i))
                         .cast(DoubleVector.SPECIES_256)
                         .cast(FloatVector.SPECIES_128)
                         .toLong();
       }
       return res * ctr;
   }

   public static void main(String [] args) {
       float [] src1 = new float[1024];
       float [] src2 = new float[1024];

       IntStream.range(0, src1.length).forEach(i -> {src1[i] = (float)i;});
       IntStream.range(0, src2.length).forEach(i -> {src2[i] = (float)500;});

       long res = 0;
       for (int i = 0; i < 100000; i++) {
          res += micro(src1, src2, i); 
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 100000; i++) {
          res += micro(src1, src2, i); 
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2 - t1) + "ms" + " [res] " + res);
   }
}
