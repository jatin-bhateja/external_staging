
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static double workload(double [] dst, double [] src, int sidx, int cnt, boolean print) {
    // Mask sharing across store and loads.
    //
    //for(int i = 0 ;i < 1024 ; i++) {
    //  System.arraycopy(src, cnt, dst, cnt, cnt);
    //}
    System.arraycopy(src, sidx , dst, 0, cnt);
    // Adding some code to prevent Load blocking due to Store forwarding.
    int res = 0;
    for(int i = 0 ; i < cnt ; i++)
      res += src[i];
    return res;
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     double [] a = new double[LEN];
     double [] r = new double[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (double)i;

        for (int i = 0 ; i < 9000000 ; i++)
           res += workload(r, a, i&511, ((int)i)&0x3, false);
     }

     try {
     Thread.sleep(5000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 250; i++) 
         for (int j = 0; j < 100000; j++) 
          res += workload(r, a, j&511, (j)&0x3, false);
       long time2 = System.currentTimeMillis();
       double tps = ((25000000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

