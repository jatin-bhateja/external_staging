
import java.util.Random;

// 12 bytes InstanceOop + Fields
class MyClass {
  public byte a;
  public byte b;
}

class test {
  public static final int LEN = 1024;

  public static byte workload(MyClass [] dst, MyClass [] src, int sidx, int cnt, boolean print) {
    System.arraycopy(src, sidx, dst, sidx, cnt);
    return dst[sidx+1].a;
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     MyClass [] a = new MyClass[LEN];
     MyClass [] r = new MyClass[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++) {
          a[i] = new MyClass();
          r[i] = new MyClass();
          a[i].a = a[i].b = (byte)i;
        }

        for (int i = 1 ; i < 9000000 ; i++)
          res += workload(r, a, i&511, 2, false);
     }

     try {
       //Thread.sleep(5000);
       System.out.println("Go PERF");
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 5000; i++)
         for (int j = 1; j < 200000; j++)
             res += workload(r, a, i&511, 2, false);
         
       long time2 = System.currentTimeMillis();
       double tps = ((10000000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     } catch(Exception e) {

     }

  }
}

