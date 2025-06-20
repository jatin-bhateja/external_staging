
import jdk.incubator.vector.*;
import java.util.stream.*;
import java.util.Arrays;

public class load_shairing {
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

   public static void micro (int [] dst, int [] src, int i) {
       IntVector vec1 = IntVector.fromArray(SPECIES, src, i);
       IntVector vec2 = IntVector.fromArray(SPECIES, src, i);
       IntVector vec3 = IntVector.fromArray(SPECIES, src, i);
       vec1.lanewise(VectorOperators.ADD, vec2)
           .lanewise(VectorOperators.ADD, vec3)
           .intoArray(dst, i);
   }

   public static void main(String [] args) {
        int [] src = IntStream.range(0, 1024).toArray();
        int [] dst = new int[1024];

        for (int i = 0; i < 100000; i++) {
            micro(dst, src, (i*16) & 1023);
        }
        System.out.println(Arrays.toString(dst));
   }
}
