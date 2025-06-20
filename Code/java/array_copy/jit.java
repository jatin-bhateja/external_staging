
import java.util.Random;

class MyClass {
  public int f1;
  public int f2;

  public MyClass(int val) {
    this.f1 = val;
    this.f2 = val;
  }
}

class test {
  public static final int LEN = 1024;

  public static int workload(MyClass [] dst, MyClass [] src, int cnt, boolean print) {
    System.arraycopy(src, 0, src, 1, cnt);
    //System.arraycopy(src, 0, dst, 0, cnt);
    return dst[0].f1;
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     MyClass [] a = new MyClass[LEN];
     MyClass [] r = new MyClass[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++) {
         a[i] = new MyClass(i);
         r[i] = new MyClass(0);
        }
        for (int i = 0 ; i < 900000 ; i++)
           res += workload(r, a, 512, false);
     }

     {
       long time1 = System.nanoTime();
       int res = 0;
       for (int i = 0; i < 100000; i++) {
          res += workload(r, a, 512, false);
       }
       long time2 = System.nanoTime();
       System.out.println("[Time] " + (time2-time1) + " ns : Res =  " + res);
     }
  }
}

