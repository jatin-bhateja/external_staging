
import java.util.Arrays;

public class primitive_array {
  public static int micro(int [] arr) {
     int res = 0;
     for (int i = 0; i < arr.length; i++) {
        res += (arr[i] * 10);
     }
     return res;
  }

  public static void main(String [] args) {
     int res = 0;
     //int size = Integer.parseInt(args[0]);
     int size = 64;
     assert size > 0 && (size & (size - 1)) == 0;
     int [] arr = new int[size];
     Arrays.fill(arr, 16);
     for (int i = 0; i < 10000; i++) {
        res += micro(arr);
     }
     System.out.println("[res] " + res);
  }
}
