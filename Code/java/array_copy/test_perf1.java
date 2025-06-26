
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static byte workload(byte [] dst, byte [] src, int cnt, boolean print) {
    // Mask sharing across store and loads.
    for(int i = 0 ;i < 1024 ; i++) {
      System.arraycopy(src, 0, src, 1, cnt);
    }
    //System.arraycopy(src, cnt + 64, dst, cnt + 64, cnt);
    return src[cnt];
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

        for (int i = 0 ; i < 90000 ; i++)
           res += workload(r, a, ((int)i)&0x3F, false);
     }

     try {
     Thread.sleep(5000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 90; i++) 
         for (int j = 0; j < 10000; j++) 
          res += workload(r, a, (j)&0x3F, false);
       long time2 = System.currentTimeMillis();
       double tps = ((9000000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

