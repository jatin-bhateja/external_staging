
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static int workload(boolean [] dst, boolean [] src, int sidx, int cnt, boolean print) {
    System.arraycopy(src, sidx , dst, 0, cnt+1);
    return dst[0] == true ? 100 : 200;
/*
    int res = 0;
    for(int i = 0 ; i < cnt; i++)
       res += (int)src[i];
    return (boolean)res;
*/
    
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     boolean [] a = new boolean[LEN];
     boolean [] r = new boolean[LEN];
     //int [] copy_size = {1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (i & 1) == 0 ? true : false;

        for (int i = 1 ; i < 9000000 ; i++)
          res += workload(r, a, i&511, i&0x1F, false);
          //res += workload(r, a, i&511, 20, false);
          //res += workload(r, a, i&511, copy_size[i&(copy_size.length-1)], false);
     }

     try {
     //Thread.sleep(10000);
     System.out.println("Go PERF");

     {
       long time1 = System.currentTimeMillis();
       int res = 0;
       for (int i = 0; i < 5000; i++)
         for (int j = 1; j < 200000; j++)
             res += workload(r, a, i&511, i&0x1F, false);
             //res += workload(r, a, i&511, 20, false);
             //res += workload(r, a, i&511, copy_size[i&(copy_size.length-1)], false);
         
       long time2 = System.currentTimeMillis();
       double tps = ((10000000L/(time2-time1))*1000);
       System.out.println("[Time] " + (time2-time1) + " ms : [TPS] : " + tps + " Res =  " + res);
     }
     } catch(Exception e) {

     }

  }
}

