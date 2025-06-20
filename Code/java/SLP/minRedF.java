
import java.util.Arrays;

public class minRedF {
  public static float micro(float [] arr) {
     float res = 0.0f;
     float sum = 0.0f;
     for (int i = 0; i < arr.length; i++) {
        res = Math.min(res, arr[i] * 10);
     }
     return sum;
  }

  public static void main(String [] args) {
     float res = 0.0f;
     float [] arr = new float[1024];
     Arrays.fill(arr, 10.0f); 
     for (int i = 0; i < 100000; i++) {
        res += micro(arr);
     }
     System.out.println("[res] " + res);

  }
} 
