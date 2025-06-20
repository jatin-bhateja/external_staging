
import jdk.incubator.vector.*;
import java.util.stream.*;

public class deopt_vector {
  public static VectorSpecies<Long> LSPECIES = LongVector.SPECIES_512;

  public static LongVector leaf(LongVector vec) {
     return vec.add(vec);
  }

  public static long micro(long [] arr, int ctr) {
     LongVector vec = LongVector.fromArray(LSPECIES, arr, 0);
     vec = leaf(vec);
     LongVector rvec = vec.lanewise(VectorOperators.ADD, 10L);
     return rvec.lane(ctr);
  }

  public static void main(String [] args) {
     long res = 0;
     long [] arr = LongStream.range(0, LSPECIES.length()).toArray();
     for (int i = 0; i < 10000; i++) {
        res += micro(arr, i & (LSPECIES.length() - 1));
     }
     System.out.println("[res] " + res);
  }
}
