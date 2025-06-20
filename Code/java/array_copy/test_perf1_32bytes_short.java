
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static short workload(short [] dst, short [] src, int cnt, boolean print) {
    // Mask sharing across store and loads.
    //
    System.arraycopy(src, cnt, dst, 0, cnt);
    return dst[0];
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     short [] a = new short[LEN];
     short [] r = new short[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (short)i;

        for (int i = 0 ; i < 9000000 ; i++)
           res += workload(r, a, ((int)i)&0xF, false);
     }

     try {
     Thread.sleep(5000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 25; i++) 
         for (int j = 0; j < 100000; j++) 
          res += workload(r, a, (j)&0xF, false);
       long time2 = System.currentTimeMillis();
       double tps = ((2500000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

