

import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class convertShape {
   public static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
   public static final VectorSpecies<Integer> I128 = IntVector.SPECIES_128;

   public static void micro(int [] res, int [] src) {
      IntVector.fromArray(I512, src, 0)
               .castShape(I128, 0)
               .reinterpretAsInts()
               .intoArray(res, 0);
   }

   public static void main(String [] args) {
      int [] src = IntStream.range(0, 16).toArray();
      int [] res = new int[4];

      for (int i = 0; i < 10000; i++) {
          micro(res, src);
      }
      System.out.println(Arrays.toString(res));
   }
}
