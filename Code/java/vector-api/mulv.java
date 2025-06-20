
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class mulv {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;
   public static void micro(int [] dst, int [] src1, int [] src2) {
       for (int i = 0; i < dst.length; i += ISP.length()) {
           IntVector vec1 = IntVector.fromArray(ISP, src1, i); 
           IntVector vec2 = IntVector.fromArray(ISP, src2, i); 
           vec1.lanewise(VectorOperators.MUL, vec2)
               .intoArray(dst, i);
       }
   }

   public static void main(String [] args) {
       int [] src1 = IntStream.range(0, 4096).toArray();
       int [] src2 = IntStream.range(0, 4096).toArray();
       int [] dst = new int[4096];

       for (int i = 0; i < 100000; i++) {
           micro(dst, src1, src2);
       }
        
       System.out.println("[res]" + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
