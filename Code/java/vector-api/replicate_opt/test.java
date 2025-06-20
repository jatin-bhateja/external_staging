
import jdk.incubator.vector.*;

public class  test {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   public static int micro(int i) {
       IntVector vec1 = IntVector.broadcast(ISP, i*8);
       IntVector vec2 = IntVector.broadcast(ISP, i*4);
       IntVector vec3 = IntVector.broadcast(ISP, i*2);
       IntVector vec4 = IntVector.broadcast(ISP, i);
 
       return vec1.lanewise(VectorOperators.MUL, vec2)
                  .lanewise(VectorOperators.MUL, vec3)
                  .lanewise(VectorOperators.MUL, vec4)
                  .lanewise(VectorOperators.ADD, i)
                  .lane(1);
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0 ; i < 10000000; i++) {
          res += micro(i);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0 ; i < 10000000; i++) {
          res += micro(i);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms [res] " + res);
   }
}
