
// CMD: java -XX:CompileThresholdScaling=0.1 -XX:+TraceDeoptimization -XX:-TieredCompilation  -XX:+DeoptimizeALot -Xbatch -XX:-PauseAtStartup --add-modules=jdk.incubator.vector -cp . deopt
import jdk.incubator.vector.*;

class deopt_shuffle_Short128 {
  public static void leaf(VectorShuffle<?> shuffle) {
     throw new AssertionError(shuffle.toString());
  }
  public static int micro(int [] arr, int ctr) {
      VectorShuffle<?> shuffle = VectorShuffle.fromArray(ShortVector.SPECIES_128, arr, 0);
      if ((ctr % 2500) == 2000) {
          leaf(shuffle);
      }
      return shuffle.laneSource(ctr & (ShortVector.SPECIES_128.length() - 1));
  }
  public static void main(String [] args) {
      long res = 0;     
      int [] arr = new int[64];
      for (int i = 0; i < arr.length; i++) {
          arr[i] = 63 - i;
      }
      for (int i = 0; i < 100000; i++) {
          res += micro(arr, i);
      }
      System.out.println("[res] " + res); 
  }
}
