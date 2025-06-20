import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class unslice_micro {
  public static final VectorSpecies<Integer> IPREFERRED = IntVector.SPECIES_PREFERRED;

  public static void micro(int origin, int [] arr1, int [] arr2, int [] res) {
    for (int i = 0; i < res.length; i += IPREFERRED.length()) {
       IntVector vec1 = IntVector.fromArray(IPREFERRED, arr1, i);
       IntVector vec2 = IntVector.fromArray(IPREFERRED, arr2, i);
       vec1.unslice(origin, vec2, 0).intoArray(res, i);
    }
  }

  public static void main(String [] args) {
     var res = new int[1024];
     var arr1 = IntStream.range(0, 1024).toArray();
     var arr2 = IntStream.range(0, 1024).map(i -> 10 * i).toArray();

     // Warming up profile for multiple receiver types (128 and 256 bit vectors).
     for (int i = 0; i < 1000000; i++) {
        micro(i & 7, arr1, arr2, res);
     }

     // Main measurement loop operates over 256 bit vector.
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 1000000; i++) {
        micro(i & 7, arr1, arr2, res);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms");
     System.out.println(Arrays.toString(Arrays.copyOfRange(res, 0 ,16)));
  }
}
