
import java.util.Arrays;
import java.util.Random;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.ByteOrder;

public class comparefb {

  public static int micro_float(FloatBuffer fb1, FloatBuffer fb2) {
    return fb1.equals(fb2) == true ? 1 : 0;
  }

  // Driver
  public static void main(String [] args) {
    int LEN = Integer.parseInt(args[0]);
    System.out.println("Length = " + LEN);
    FloatBuffer fb1 = ByteBuffer.allocate(LEN*10*Float.BYTES).order(ByteOrder.BIG_ENDIAN).asFloatBuffer();
    FloatBuffer fb2 = ByteBuffer.allocate(LEN*10*Float.BYTES).order(ByteOrder.BIG_ENDIAN).asFloatBuffer();

    FloatBuffer fs1 = fb1.slice(10, LEN);
    FloatBuffer fs2 = fb2.slice(10, LEN);

    fs1.put(3, 0.4f);

    int Res = 0;
    System.out.println("Warmup completed");
    long t1 = System.currentTimeMillis();
    for (int k = 0 ; k < 100000 ; k++) {
      Res += micro_float(fs1, fs2);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + "ms Res = " + Res);
  }
}
