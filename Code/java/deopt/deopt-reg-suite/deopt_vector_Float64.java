
// CMD: java -XX:CompileThresholdScaling=0.1 -XX:+TraceDeoptimization -XX:-TieredCompilation  -XX:+DeoptimizeALot -Xbatch -XX:-PauseAtStartup --add-modules=jdk.incubator.vector -cp . deopt
import jdk.incubator.vector.*;

class deopt_vector_Float64 {
  public static void leaf(Vector<?> vec) {
     throw new AssertionError(vec.toString());
  }

  public static float micro(float [] arr, int ctr) {
      FloatVector vec = FloatVector.fromArray(FloatVector.SPECIES_64, arr, 0);
      if (ctr == 99990) {
          leaf(vec);
      }
      int idx = ctr & (FloatVector.SPECIES_64.length() - 1);
      return vec.lane(idx);
  }

  public static void main(String [] args) {
      int res = 0;     
      float [] arr = new float [64];
      for (int i = 0; i < arr.length; i++) {
          arr[i] = (float)i;
      }
      for (int i = 0; i < 100000; i++) {
         res += micro(arr, i);
      }
      System.out.println("[res] " + res); 
  }
}
