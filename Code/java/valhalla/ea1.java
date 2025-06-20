
import java.util.Arrays;

primitive class myclass {
 public final int [] value;
 public myclass(int [] arr) {
   value = arr;
 }
}

class ea1 {
   static int micro2(int val) {
      int res = 0;
      int [] arr = new int[16];
      //
      for(int i = 0 ;  i < 16; i++) {
         // 
         arr[i] = val;
         res += arr[i];
      }
      return res;
   }
   static int micro3(int val) {
      int res = 0;
      int [] arr = new int[32];
      //myclass obj = new myclass(arr);
      //
      for(int i = 0 ;  i < arr.length; i++) {
      //for(int i = 0 ;  i < obj.value.length; i++) {
         //obj.value[i] = val;
         arr[i] = i;
         //res += obj.value[i];
         res += arr[i];
      }
      return res;
   }
   static int micro4(int val) {
      int res = 0;
      int [] arr = new int[8];
      //myclass obj = new myclass(arr);
      //
      for(int i = 0 ;  i < arr.length; i++) {
      //for(int i = 0 ;  i < obj.value.length; i++) {
         //obj.value[i] = val;
         arr[i] = i;
         //res += obj.value[i];
         res += arr[i];
      }
      return res;
   }
   public static void main(String [] args) {
      int res = 0;
      for(int i = 0; i < 100000; i++) {
         res += micro4(1024);
      }
      long t1 = System.currentTimeMillis();
      for(int i = 0; i < 100000; i++) {
         res += micro4(1024);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[RES] " + res + " [Time] " + (t2-t1));
   }
}
