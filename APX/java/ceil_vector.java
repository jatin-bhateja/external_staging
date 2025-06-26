
import java.util.stream.IntStream;
import java.util.Arrays;

public class ceil_vector {
   public static void micro(double [] res, double [] src) {
       for(int i = 0; i < res.length; i++) {
           res[i] = Math.ceil(src[i]);
       }
   }
   public static void main(String [] args) {
       double [] src = IntStream.range(0, 4096).mapToDouble(i -> 10.0 + i * 0.5).toArray();
       double [] res = new double[4096];
       for (int i = 0; i < 10000; i++) {
           micro(res, src);
       }
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
   }
}
