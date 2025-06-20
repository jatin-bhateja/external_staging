
import java.util.Arrays;
import jdk.incubator.vector.*;

//primitive class MyVector512 {
class MyVector512 {
  // No allocation over heap, no GC penalty.
  public int arr1;
  public int arr2;
  public int arr3;
  public int arr4;
  public int arr5;
  public int arr6;
  public int arr7;
  public int arr8;
  public int arr9;
  public int arr10;
  public int arr11;
  public int arr12;
  public int arr13;
  public int arr14;
  public int arr15;
  public int arr16;
  public MyVector512(int val) {
    this.arr1 = val;
    this.arr2 = val;
    this.arr3 = val;
    this.arr4 = val;
    this.arr5 = val;
    this.arr6 = val;
    this.arr7 = val;
    this.arr8 = val;
    this.arr9 = val;
    this.arr10 = val;
    this.arr11 = val;
    this.arr12 = val;
    this.arr13 = val;
    this.arr14 = val;
    this.arr15 = val;
    this.arr16 = val;
  }
  public MyVector512(int arr1, int arr2, int arr3, int arr4, int arr5, int arr6, int arr7, int arr8,
                     int arr9, int arr10, int arr11, int arr12, int arr13, int arr14, int arr15, int arr16) {
    this.arr1 = arr1;
    this.arr2 = arr2;
    this.arr3 = arr3;
    this.arr4 = arr4;
    this.arr5 = arr5;
    this.arr6 = arr6;
    this.arr7 = arr7;
    this.arr8 = arr8;
    this.arr9 = arr9;
    this.arr10 = arr10;
    this.arr11 = arr11;
    this.arr12 = arr12;
    this.arr13 = arr13;
    this.arr14 = arr14;
    this.arr15 = arr15;
    this.arr16 = arr16;
  }
  public MyVector512 add(int val) {
     int res1 = arr1 + val;
     int res2 = arr2 + val;
     int res3 = arr3 + val;
     int res4 = arr4 + val;
     int res5 = arr5 + val;
     int res6 = arr6 + val;
     int res7 = arr7 + val;
     int res8 = arr8 + val;
     int res9 = arr9 + val;
     int res10 = arr10 + val;
     int res11 = arr11 + val;
     int res12 = arr12 + val;
     int res13 = arr13 + val;
     int res14 = arr14 + val;
     int res15 = arr15 + val;
     int res16 = arr16 + val;
     return new MyVector512(res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12, res13, res14, res15, res16);
  }
  public int lane(int idx) {
     switch(idx) {
       case 1 : return arr1;
       case 2 : return arr2;
       case 3 : return arr3;
       case 4 : return arr4;
       case 5 : return arr5;
       case 6 : return arr6;
       case 7 : return arr7;
       case 8 : return arr8;
       case 9 : return arr9;
       case 10 : return arr10;
       case 11 : return arr11;
       case 12 : return arr12;
       case 13 : return arr13;
       case 14 : return arr14;
       case 15 : return arr15;
       case 16 : return arr16;
       default : return -1;
     }
  }
}

public class values2 {
  public static final int SPECIES = 16;
  public static int leaf(MyVector512 vec, int idx) {
     return vec.add(10).lane(idx);
  }
  public static int micro(int [] src, int ctr) {
    int val = 0;
    for (int i = 0; i < src.length; i+=SPECIES) {
      MyVector512 vec1 = new MyVector512(src[i], src[i+1], src[i+2], src[i+3], src[i+4], src[i+5], src[i+6], src[i+7], src[i+8],
                                         src[i+9], src[i+10], src[i+11], src[i+12], src[i+13], src[i+14], src[i+15]);
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
