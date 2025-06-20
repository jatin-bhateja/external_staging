
import jdk.incubator.vector.*;
import java.util.Arrays;

public class satAdd {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   public static int [] i1 = new int[1024];
   public static int [] i2 = new int[1024];
   public static int [] res = new int[1024];
   
   public static void micro() {
       for (int i = 0; i < 1024; i += ISP.length()) {
           IntVector.fromArray(ISP, i1, i)
                   .lanewise(VectorOperators.SADD,
                             IntVector.fromArray(ISP, i2, i))
                   .intoArray(res, i);
       }
   }

   public static void main(String [] args) {
       for (int ic = 0 ; ic < 10000; ic++) {
           micro();
       }
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
   }
}
