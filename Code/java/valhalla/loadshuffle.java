
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.function.*;

public class loadshuffle {
   public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_128;

   public static int micro() {
     IntUnaryOperator fn = a -> a + 5;
     var shuffle = VectorShuffle.fromOp(SPECIES, fn);
     return shuffle.toArray()[4];
   }

   public static void main(String [] args) {
     int res  = 0;
     for(int i = 0; i < 10000; i++) {
        res += micro();
     }
     System.out.println(res);
   }
}
