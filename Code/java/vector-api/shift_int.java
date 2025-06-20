
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class shift_int {
  public static void workload(int [] res, int [] arr, int [] shift) {
    IntVector vec = IntVector.fromArray(IntVector.SPECIES_256, arr, 0);
    IntVector sv = IntVector.fromArray(IntVector.SPECIES_256, shift, 0);
    vec.lanewise(VectorOperators.LSHL, sv).intoArray(res,0);
  }

  public static void main(String [] args) {
    int [] res = new int[8];
    int [] arr = IntStream.range(0, 8).map(j -> j * 8).toArray();
    int [] shift = IntStream.range(0, 8).toArray();
    for (int i = 0; i < 10000; i++) {
      workload(res, arr, shift);
    }
    System.out.println(Arrays.toString(res));
  }
}
