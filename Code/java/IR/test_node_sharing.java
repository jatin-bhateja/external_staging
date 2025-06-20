
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class test_node_sharing {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   public static void micro(int [] res, int [] src1, int [] src2) {
       for (int i = 0; i < ISP.loopBound(res.length); i += ISP.length()) {
           IntVector vec1 = IntVector.fromArray(ISP, src1, i);
           IntVector vec2 = IntVector.fromArray(ISP, src2, i);
           // Parallel dispatch over two exeuction ports will absrob any impact on 
           // latency of the worklet, but path length will improve.
           IntVector vec3 = vec1.lanewise(VectorOperators.ADD, vec2);
           IntVector vec4 = vec2.lanewise(VectorOperators.ADD, vec1);
           vec4.lanewise(VectorOperators.ADD, vec3)
               .intoArray(res, i);
       }
   }

   public static void main(String [] args) {
       int [] src1 = IntStream.range(0, 4096).toArray();
       int [] src2 = IntStream.range(0, 4096).toArray();
       int [] res = new int[4096];
       for (int ic = 0; ic < 100000; ic++) {
           micro(res, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int ic = 0; ic < 100000; ic++) {
           micro(res, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + "ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
   }
}
