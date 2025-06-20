import java.util.Arrays;
import java.util.stream.IntStream;
import jdk.incubator.vector.*;

public class slice {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_PREFERRED;

  public static void micro(int origin, int [] src1, int [] src2, int [] res) {
     for (int i = 0; i < res.length; i += SPECIES.length()) {
         IntVector vec1 = IntVector.fromArray(SPECIES, src1, i);
         IntVector vec2 = IntVector.fromArray(SPECIES, src2, i);
         vec1.slice(4, vec2).intoArray(res, i);
     }
  }

  public static void main(String [] args) {
     int [] res = new int[1024];
     int origin =  Integer.parseInt(args[0]);
     var src1 = IntStream.range(0, 1024).toArray();
     var src2 = IntStream.range(0, 1024).map(i -> i * 10).toArray();

     // Warming up profile for multiple receiver types (128 and 256 bit vectors).
     for (int i = 0; i < 20000; i++) {
        micro(origin, src1, src2, res);
     }

     // Main measurement loop operates over 256 bit vector.
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 200000; i++) {
        micro(origin, src1, src2, res);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms");
     System.out.println(Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
  }
}
