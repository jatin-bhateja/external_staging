
// CMD: java -XX:CompileThresholdScaling=0.1 -XX:+TraceDeoptimization -XX:-TieredCompilation  -XX:+DeoptimizeALot -Xbatch -XX:-PauseAtStartup --add-modules=jdk.incubator.vector -cp . deopt
import jdk.incubator.vector.*;

class deopt_mask_Byte64 {
  public static void leaf(VectorMask<?> mask) {
     throw new AssertionError(mask.toString());
  }

  public static int micro(boolean [] arr, int ctr) {
      VectorMask<?> vec = VectorMask.fromArray(ByteVector.SPECIES_64, arr, 0);
      if (ctr == 99990) {
          leaf(vec);
      }
      int idx = ctr & (ByteVector.SPECIES_64.length() - 1);
      return vec.laneIsSet(idx) ? idx : 0;
  }

  public static void main(String [] args) {
      int res = 0;     
      boolean [] arr = new boolean [64];
      for (int i = 0; i < arr.length; i++) {
          //arr[i] = ((i & 1) == 0) ? true : false;
          arr[i] = true;
      }
      for (int i = 0; i < 100000; i++) {
          res += micro(arr, i);
      }
      System.out.println("[res] " + res); 
  }
}
