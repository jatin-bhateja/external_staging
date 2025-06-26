
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test_shift {
   public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_PREFERRED; 

   public static void micro(byte [] res, byte [] src, byte [] shift) {
       for (int i = 0; i < BSP.loopBound(res.length); i += BSP.length()) {
       ByteVector vec = ByteVector.fromArrays(
   }

}
