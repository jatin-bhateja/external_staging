
import java.util.Arrays;
import jdk.incubator.vector.*;

//primitive class MyVector512 {
class MyVector512 {
  // Allocation over Heap, under GC perview.
  // @Stack, not-relevant with reference variable.
  // Should be tied to the allocation site.
  // OR better is to have scalarized fields.
  public int [] arr;
  public MyVector512(int [] arr) {
    this.arr = arr;
  }
  public MyVector512(int [] arr, int idx) {
    this.arr = new int[16];
    System.arraycopy(arr, idx, this.arr, 0, 16);
  }
  public MyVector512 add(int val) {
     int [] res = new int[16];
     for(int i = 0; i < res.length; i++) {
        res[i] = arr[i] + val;
     }
     return new MyVector512(res);
  }
  public int lane(int idx) {
     return arr[idx];
  }
}

public class values1 {
  public static final int SPECIES = 16;
  public static int leaf(MyVector512 vec, int idx) {
     return vec.add(10).lane(idx);
  }
  public static int micro(int [] src, int ctr) {
    int val = 0;
    for (int i = 0; i < src.length; i+=SPECIES) {
      MyVector512 vec1 = new MyVector512(src, i);
      val += leaf(vec1, ctr);
    }
    return val;
  }
  public static void main(String [] args) {
     int val = 0;
     int size = Integer.parseInt(args[0]);
     int [] src = new int[size];
     Arrays.fill(src, 10);
     for(int i = 0; i < 1000000; i++) {
        val += micro(src, i & (SPECIES-1)); 
     } 
     val = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 1000000; i++) {
        val += micro(src, i & (SPECIES-1)); 
     } 
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + val);
  }

}
