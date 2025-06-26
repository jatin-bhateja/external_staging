

class myclass_with_ea {
  public int f1;
  public int f2;
  public int f3;
  public int f4;
  public myclass_with_ea(int f1, int f2, int f3, int f4) {
     this.f1 = f1;
     this.f2 = f2;
     this.f3 = f3;
     this.f4 = f4;
  }
}


primitive class myclass_as_value  {
  public int f1;
  public int f2;
  public int f3;
  public int f4;
  public myclass_as_value(int f1, int f2, int f3, int f4) {
     this.f1 = f1;
     this.f2 = f2;
     this.f3 = f3;
     this.f4 = f4;
  }
}

public class values3 {
   public static int leaf1(myclass_with_ea obj) {
      return obj.f1 >> obj.f2 + obj.f2 << obj.f4;
   }
   public static int micro1(int ctr, int a1, int a2, int a3, int a4) {
      // non-escaping, scalarizable over stack.
      myclass_with_ea obj = new myclass_with_ea(a1, a2, a3, a4);
      return leaf1(obj) + ctr;
   }
   public static int leaf2(myclass_as_value obj) {
      return obj.f1 >> obj.f2 + obj.f2 << obj.f4;
   }
   public static int micro2(int ctr, int a1, int a2, int a3, int a4) {
      // primitive class, each filed is implicitly final thus immutable, scalarizable over stack.
      myclass_as_value obj = new myclass_as_value(a1, a2, a3, a4);
      return leaf2(obj) + ctr;
   }
   public static void main(String [] args) {
      int algo = Integer.parseInt(args[0]);
      if (algo == 0) {
        int res1 = 0;
        for(int i = 0; i < 1000000; i++) {
           res1 += micro1(i, i+1, i+2, i+3, i+4);
        }
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 1000000; i++) {
           res1 += micro1(i, i+1, i+2, i+3, i+4);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Res Non-Value] " + res1 + " [Time] " + (t2-t1) + " ms");
      } else {
        int res2 = 0;
        for(int i = 0; i < 1000000; i++) {
           res2 += micro2(i, i+1, i+2, i+3, i+4);
        }
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 1000000; i++) {
           res2 += micro2(i, i+1, i+2, i+3, i+4);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Res Value] " + res2 + " [Time] " + (t2-t1) + " ms");
      }
   }
}
