
import java.util.stream.IntStream;

public class test {
   public static long micro(int size) {
      long cnt = 0;
      int [] res = IntStream.range(0, size).toArray();
      for (int i = 0; i < res.length; i++) {
          cnt += res[i];
      }
      return cnt;
   }

   public static void main(String [] args) {
      long res = 0;
      int size = Integer.parseInt(args[0]);
      for (int i = 0; i < 1000000; i++) {
          res += micro(size);
      }
      System.out.println("[res] " + res);
   }
}
