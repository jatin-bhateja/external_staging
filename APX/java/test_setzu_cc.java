
import java.util.Arrays;
import java.util.stream.IntStream;

public class test_setzu_cc {
  public static void micro(int [] res, int a, int b, int idx) {
     res[idx] = Integer.compareUnsigned(a, b);
  }

  public static void main(String [] args) {
      int [] src1 = IntStream.range(-500, 500).toArray(); 
      int [] src2 = IntStream.range(-700, 300).toArray(); 
      int [] res  = new int[src1.length];
      for (int i = 0; i < 10000; i++) {
          int idx = i % src1.length; 
          micro(res, src1[idx], src2[idx], idx); 
      }
      System.out.println("[res] " + Arrays.toString(res));
  }
}
