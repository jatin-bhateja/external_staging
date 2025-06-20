
import java.util.Arrays;
import jdk.incubator.vector.*;

public class paddd {
   public static void micro(int d1, int d2, int d3, int d4, int d5, int d6, int [] val1, int [] val2) {
       IntVector vec1 = IntVector.fromArray(IntVector.SPECIES_128, val1, 0);
       IntVector vec2 = IntVector.fromArray(IntVector.SPECIES_128, val2, 0);
       vec1.lanewise(VectorOperators.ADD, vec2)
           .intoArray(val1, 0);
   }
   public static void main(String [] args) {
       int [] val = new int[4];
       Arrays.fill(val, 11);
       for (int i = 0; i < 10000; i++) {
            micro(1,2,3,4,5,6,val, val);
       }
       System.out.println("[res] " + Arrays.toString(val));
   }
}
