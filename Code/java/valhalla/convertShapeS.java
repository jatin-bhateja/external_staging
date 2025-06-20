

import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.lang.foreign.MemorySegment;

public class convertShapeS {
   public static final VectorSpecies<Short> S64 = ShortVector.SPECIES_64;
   public static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;

   public static void micro(byte [] res, byte [] src) {
      MemorySegment msrc = MemorySegment.ofArray(src); 
      MemorySegment mres = MemorySegment.ofArray(res); 
      ShortVector.fromMemorySegment(S64, msrc, 0, java.nio.ByteOrder.nativeOrder())
               .castShape(S512, -1)
               .reinterpretAsShorts()
               .intoMemorySegment(mres, 0, java.nio.ByteOrder.nativeOrder());
   }

   public static void main(String [] args) {
      byte [] src = {1,2,3,4,5,6,7,8};
      byte [] res = new byte[64];

      for (int i = 0; i < 10000; i++) {
          micro(res, src);
      }
      System.out.println(Arrays.toString(res));
   }
}
