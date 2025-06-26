
import java.util.Arrays;

class myclass {
 public int sf1;
 public int sf2;
 public int [] af3;
 myclass(int sft1, int sf2, int [] af3) {
   this.sf1 = sf1;
   this.sf2 = sf2;
   this.af3 = af3;
 } 
}

class ea1 {
   static int micro1(int len, int val) {
      int res = 0;
      int [] arr = new int[len];
      // memory escaping into fill call, fill value can be propagated to users.
      myclass obj = new myclass(10,20,arr);
      if (val% 10000 == 0) {
        arr = null;
      } 
      Arrays.fill(arr, obj.sf1);
      return obj.sf1 + obj.sf2 + obj.af3.length;
   }
   static int micro2(int val) {
      int res = 0;
      int [] arr = new int[32];
      //
      for(int i = 0 ;  i < 32; i++) {
         // 
         arr[i] = val;
         res += arr[i];
      }
      return res;
   }
   public static void main(String [] args) {
      int res = 0;
      for(int i = 0; i < 100000; i++) {
         res += micro2(1024);
      }
      System.out.println("[RES] " + res);
   }
}
