
// CMD: java -XX:CompileThresholdScaling=0.1 -XX:+TraceDeoptimization -XX:-TieredCompilation  -XX:+DeoptimizeALot -Xbatch -XX:-PauseAtStartup --add-modules=jdk.incubator.vector -cp . deopt
import jdk.incubator.vector.*;

class deopt_vector_Long128 {
  public static void leaf(Vector<?> vec) {
     throw new AssertionError(vec.toString());
  }

  public static long micro(long [] arr, int ctr) {
      LongVector vec = LongVector.fromArray(LongVector.SPECIES_128, arr, 0);
      if (ctr == 99990) {
          leaf(vec);
      }
      int idx = ctr & (LongVector.SPECIES_128.length() - 1);
      return vec.lane(idx);
  }

  public static void main(String [] args) {
      int res = 0;     
      long [] arr = new long [64];
      for (int i = 0; i < arr.length; i++) {
          arr[i] = (long)i;
      }
      for (int i = 0; i < 100000; i++) {
         res += micro(arr, i);
      }
      System.out.println("[res] " + res); 
  }
}
