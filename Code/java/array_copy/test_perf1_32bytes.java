
import java.util.Random;

class test {
  public static final int LEN = 4096;

  public static byte workload(byte [] dst, byte [] src, int sidx, int cnt, boolean print) {
    System.arraycopy(src, 0, dst, 0, 555);
    return dst[10];
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     byte [] a = new byte[LEN];
     byte [] r = new byte[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (byte)i;

        for (int i = 1 ; i < 9000000 ; i++)
          res += workload(r, a, i&511, i&0x1F, false);
     }

     try {
     //Thread.sleep(10000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 5000; i++)
         for (int j = 1; j < 20000; j++)
             res += workload(r, a, i&511, i&0x1F, false);
         
       long time2 = System.currentTimeMillis();
       double tps = ((10000000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

