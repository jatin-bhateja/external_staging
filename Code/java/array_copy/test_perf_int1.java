
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static int workload(int [] dst, int [] src, int cnt, boolean print) {
    // Exercises both the conditions of disjoint arrays ( cnt=0:15 (src + copy_length < dst) , cnt=32:63 (dst < src)
    //System.arraycopy(src, cnt, src, 32,  cnt);

    // Mask sharing across store and loads.
    System.arraycopy(src, cnt, src, cnt, cnt);
    System.arraycopy(src, 64 + cnt, src, 64 + cnt, cnt);
    System.arraycopy(src, 128 + cnt, src, 128 + cnt, cnt);
    System.arraycopy(src, 192 + cnt, src, 192 + cnt, cnt);
    return src[cnt];
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     int [] a = new int[LEN];
     int [] r = new int[LEN];

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (int)i;

        for (int i = 0 ; i < 9000000 ; i++)
           res += workload(r, a, ((int)i)&0xF, false);
     }

     try {
     Thread.sleep(5000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       //for (int i = 0; i < 5000; i++) 
         for (int j = 0; j < 100000; j++) 
          res += workload(r, a, (j)&0xF, false);
       long time2 = System.currentTimeMillis();
       double tps = (1000000L/((time2-time1)*1000));
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

