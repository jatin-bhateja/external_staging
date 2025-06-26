
import jdk.incubator.vector.*;

public class insertQ {
   public static long micro(long [] arr, int d1, int d2, int d3, int d4, int d5, long value) {
      long res =  d1 + d2 + d2 + d4 + d5;
      LongVector.fromArray(LongVector.SPECIES_128, arr, 0)
                .withLane(1, value)
                .intoArray(arr, 0);
      return res + arr[1];
   }

   public static void main(String [] args) {
      long res = 0;
      long [] arr = {1,2};
      for (int i = 0; i < 10000; i++) {
          res += micro(arr, 1, 2, 3, 4, 5, res);
      }
      System.out.println("[res] " + res);
   }
}
