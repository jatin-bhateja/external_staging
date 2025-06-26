
import java.util.Arrays;

primitive class float16 {
//class float16 {
  public short val;
  public float16(short val) {
     this.val = val;
  }
}


public class flat_arrays {
  public static int micro(float16 [] arr) {
     int res = 0;
     for (int i = 0; i < arr.length; i++) {
        res += (arr[i].val * 10);
     }
     return res;
  }

  public static void main(String [] args) {
     int res = 0;
     int size = Integer.parseInt(args[0]);
     assert size > 0 && (size & (size - 1)) == 0;
     float16 [] arr1 = new float16[size];
     int   [] arr2 = new int[size];
     Arrays.fill(arr2, 16);
     for (int i = 0; i < arr1.length; i++) {
        arr1[i] = new float16((short)i);
     }
     for (int i = 0; i < 900000; i++) {
        res += micro(arr1) + arr2[i & (size-1)];
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 100000; i++) {
        res += micro(arr1) + arr2[i & (size-1)];
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time]  " + (t2-t1) + "ms  [res] " + res);
  }
}
