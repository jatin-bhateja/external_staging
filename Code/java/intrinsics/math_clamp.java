
import java.util.Random;

// Value resoultion.
public class math_clamp {
  public static float micro(float val, float f1, float f2) {
     return Math.clamp(val, f1, f2); 
  }
  public static void main(String [] args) {
    float res = 0.0f;
    Random r = new Random(1024);
    for (int i = 0; i < 10000; i++) {
        res += micro(r.nextFloat(), r.nextFloat(), r.nextFloat());
    }
    System.out.println(res);
  }
}
