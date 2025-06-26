
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class forwarding {
   // Sub-optimal code gen with multiple replicates.
   public static int micro(int [] arr) {
      VectorMask<Integer> store_mask = VectorMask.fromLong(IntVector.SPECIES_256, 15);
      IntVector store_value = IntVector.broadcast(IntVector.SPECIES_256, 1);
      store_value.intoArray(arr, 0, store_mask);                   // write updates 0-3 lane out of 8 lanes.
      //store_value.intoArray(arr, 0);                                 // write updates all 8 lanes.
      IntVector load_value = IntVector.fromArray(IntVector.SPECIES_256, arr, 0); // no-forwarding should happens.
      return load_value.lane(7);
   }

   public static void main(String [] args) {
      int res = 0;
      int [] arr = IntStream.range(0, 8).toArray();
      for (int i = 0; i < 100000; i++) {
          res += micro(arr);
      }
      System.out.println("[res] " + res);
   }
}
