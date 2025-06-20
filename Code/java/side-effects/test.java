
import java.util.Arrays;

public class test {
  static int micro(int a, int [] arr) {
     if (a > 1000) {
        int res = 0;
        for(int i = 0; i < arr.length; i++) {
           res += arr[i]; 
        }
        return res;
     } else if (a < 500) {
        int res = 0;
        for(int i = 0; i < arr.length; i++) {
           res -= arr[i]; 
        }
        return res;
     } else {
        int res = 1;
        for(int i = 0; i < arr.length; i++) {
           res *= arr[i]; 
        }
        return res;
     }  
  }

  public static void main(String [] args) {
     int res = 0;
     int [] arr = new int[1024];
     Arrays.fill(arr, 10);
     for(int i = 0; i < 100000; i++) {
        res += micro(700, arr);
     } 

     res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 100000; i++) {
        res += micro(700, arr);
     } 
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + "ms  [res] " + res);
  }
}
