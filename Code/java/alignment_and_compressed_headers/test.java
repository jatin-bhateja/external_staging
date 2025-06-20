

import java.util.Arrays;

public class test {
   long [] larr = {1,2,3,4};
   int [] iarr = {1,2,3,4};
   short [] sarr = {(short)1, (short)2, (short)3, (short)4};
   byte [] barr = { (byte)1, (byte)2, (byte)3, (byte)4};

   public static void main(String [] args) {
       test obj = new test();
       System.out.println(Arrays.hashCode(obj.barr));
       System.out.println(Arrays.hashCode(obj.sarr));
       System.out.println(Arrays.hashCode(obj.iarr));
       System.out.println(Arrays.hashCode(obj.larr));
   }
}
