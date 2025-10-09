
// bug    : java -XX:+UseNonAtomicValueFlattening -XX:MaxVectorSize=16 --add-modules=jdk.incubator.vector  -Xint --enable-preview -cp .  test 
// no bug : java -XX:-UseNonAtomicValueFlattening -XX:MaxVectorSize=16 --add-modules=jdk.incubator.vector  -Xint --enable-preview -cp .  test 

import jdk.incubator.vector.*;
import java.util.Arrays;

public class masked_rearrange_bug_actual {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_PREFERRED;

  public static void shuffle(int [] arr, int [] neworder, int i) {
     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, -1L);
     IntVector IV = IntVector.fromArray(SPECIES, arr, i);
     VectorShuffle<Integer> shufflev = VectorShuffle.fromArray(SPECIES, neworder, i);
     IV.rearrange(shufflev, mask).intoArray(arr,i);
  }

  public static void main(String [] args) {
     int [] arr = new int[32];
     int [] neworder = new int[32];
     for(int i = 0 ; i < 32 ; i++) {
       arr[i] = i;
       neworder[i] = i & 3;
     }
     shuffle(arr, neworder, 0);
     System.out.println(Arrays.toString(arr));
  }
}
