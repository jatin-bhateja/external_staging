
import java.util.Arrays;

value class point {
  int field1;
  int field2;
  public point(int fld1, int fld2)  {
     this.field1 = fld1;
     this.field2 = fld2;
  }
}

public class basic_load {
   public static int [] arr;

   public static int micro(int idx1, int idx2) {
      point p1 = new point(arr[idx1], arr[idx2]);
      return p1.field1 + p1.field2;
   }
    
   public static void main(String [] args) {
      int res = 0;
      arr = new int[10000];
      Arrays.fill(arr, 1);
      for (int i = 0; i < arr.length-1; i++) {
         res += micro(arr[i], arr[i+1]);
      }
      System.out.println(res);
   }
}
