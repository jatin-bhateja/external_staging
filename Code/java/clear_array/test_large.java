
import java.util.Arrays;

public class test_large {
   public static int micro (int size, int ctr, int val) {
       int [] arr = new int[2048];
       arr[ctr] = val;
       return Arrays.hashCode(arr);
   }
   public static void main(String [] args) {
      long res = 0;
      int size = Integer.parseInt(args[0]);
      for (int i = 0; i < 1000000; i++) {
          res += micro(size, i % size, i);
      } 
      long t1 = System.currentTimeMillis(); 
      for (int i = 0; i < 1000000; i++) {
          res += micro(size, i % size, i);
      } 
      long t2 = System.currentTimeMillis(); 
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
   }
}
