
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static int workload(int [] dst, int [] src, int sidx, int cnt, boolean print) {
    // Mask sharing across store and loads.
    //
    //for(int i = 0 ;i < 1024 ; i++) {
      // constant Unroll
      // System.arraycopy(src, cnt, dst, cnt, 8);
    //  System.arraycopy(src, cnt, dst, cnt, cnt);
    //}
    System.arraycopy(src, 0, dst, 0, 5);
    //System.arraycopy(src, sidx , dst, 0, cnt);
    //System.arraycopy(src, cnt + 32 , dst, cnt + 32, cnt);
    //System.arraycopy(src, cnt + 32, dst, cnt + 32, cnt);
    int res = 0;
    for(int i = 0 ; i < 5; i++)
       res += dst[i];
    return res;
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     int [] a = new int[LEN];
     int [] r = new int[LEN];

     // Warmup
     int res = 0;
     for (int i = 0 ; i < LEN; i++)
       a[i] = (int)i;

     for (int i = 0 ; i < 9000000 ; i++)
       res += workload(r, a, i & 511, ((int)i)&0x7, false);

      //Thread.sleep(5000);
      System.out.println("Go PERF");
      long time1 = System.nanoTime();
      for (int i = 0; i < 5000; i++) { 
        for (int j = 0; j < 100000; j++)  
          res += workload(r, a, (i+j) & 511, (i+j)&0x7, false);
      }
      long time2 = System.nanoTime();
      double tps = ((500000000L/(time2-time1))*1000000000);
      System.out.println("[Time] " + (time2-time1) + " ns : [TPS] : " + tps + " Res =  " + res);
  }
}

