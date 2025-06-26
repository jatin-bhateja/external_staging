
import java.util.Arrays;

class myclassP {
   int doAction(int [] arr) {
      int res = 0;
      for(int i = 0; i < arr.length; i++) {
          res += arr[i] << 10; 
      }
      return res;
   }
}

class myclassC1 extends myclassP {
   int doAction(int [] arr) {
      int res = 0;
      for(int i = 0; i < arr.length; i++) {
          res += arr[i] << 20; 
      }
      return res;
   }
}
class myclassC2 extends myclassP {
   int doAction(int [] arr) {
      int res = 0;
      for(int i = 0; i < arr.length; i++) {
          res += arr[i] << 30; 
      }
      return res;
   }
}

public class polymorphic {
   public int doCall(myclassP obj, int [] arr) {
      return obj.doAction(arr) * 100;
   }
   public static void main(String [] args) {
      int size = Integer.parseInt(args[0]);
      int algo = Integer.parseInt(args[1]);
      int [] arr = new int[size];
      Arrays.fill(arr, 1);
      polymorphic caller = new polymorphic();
      if (algo == 0) {
        // Monomorphic call dispatch.
        int res = 0;
        myclassP  obj =  new myclassP();
        for(int i = 0; i < 100000; i++) {
           res += caller.doCall(obj, arr);    
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++) {
           res += caller.doCall(obj, arr);    
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Mono-morphic Res] " + res + "  [Time] " + (t2-t1) + " ms"); 
      } else if (algo == 1) {
        // Bimorphic call dispatch.
        int res = 0;
        myclassP  obj1 =  new myclassC1();
        myclassP  obj2 =  new myclassC2();
        for(int i = 0; i < 100000; i++) {
           if ((i & 128) == 0) {
              res += caller.doCall(obj1, arr);    
           } else {
              res += caller.doCall(obj2, arr);    
           }
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++) {
           if ((i & 128) == 00) {
              res += caller.doCall(obj1, arr);    
           } else {
              res += caller.doCall(obj2, arr);    
           }
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Bi-morphic Res] " + res + "  [Time] " + (t2-t1) + " ms"); 
      } else if (algo == 2) {
        // polymorphic call dispatch.
        int res = 0;
        myclassP  obj1 =  new myclassC1();
        myclassP  obj2 =  new myclassC2();
        myclassP  obj3 =  new myclassP();
        for(int i = 0; i < 100000; i++) {
           switch(i & 3) {
             case 0 : res += caller.doCall(obj1, arr);    
             case 1 : res += caller.doCall(obj2, arr);
             defalut: res += caller.doCall(obj3, arr); 
           }
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++) {
           switch(i & 3) {
             case 0 : res += caller.doCall(obj1, arr);    
             case 1 : res += caller.doCall(obj2, arr);
             defalut: res += caller.doCall(obj3, arr); 
           }
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Poly-morphic Res] " + res + "  [Time] " + (t2-t1) + " ms"); 
      }
   } 
}
