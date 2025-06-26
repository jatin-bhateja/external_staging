
import java.util.Arrays;
import java.util.stream.IntStream;

public class c2_stubs {
   public static int micro(int [] arr) {
      return Arrays.hashCode(arr);
   }
   public static int caller(int [] arr) {
      return micro(arr) + arr[0];
   }

   public static void main(String [] args) {
      int [] arr = IntStream.range(0, 4096).toArray();
      int res = 0;
      for (int i = 0; i < 100000; i++) {
          res += caller(arr);
      }
      System.out.println("[res] " + res);
   }
}
