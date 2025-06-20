
import java.util.Arrays;

public class test {
  public static void main(String [] args) {
     int res = 0;
     int [] arr = new int[10000];
     Arrays.fill(arr, 10);
     for (int i = 0; i < arr.length; i++) {
         res += arr[i];
     }
     System.out.println(res);
  }
}
