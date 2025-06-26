
import java.util.Random;

class test {
  public static final int LEN = 17000;

  public static char workload(char [] dst, char [] src, int sidx, int cnt, boolean print) {
    System.arraycopy(src, 0 , dst, 0, cnt);
    return dst[0];
/*
    int res = 0;
    for(int i = 0 ; i < cnt; i++)
       res += (int)src[i];
    return (char)res;
*/
    
  }

  public static void main(String [] args) {
     Random ro = new Random(100);
     char [] a = new char[LEN];
     char [] r = new char[LEN];
     //int [] copy_size = {1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};

     // Warmup
     { 
        int res = 0;
        for (int i = 0 ; i < LEN; i++)
         a[i] = (char)i;

        for (int i = 1 ; i < 90000 ; i++)
          res += workload(r, a, i&511, i&0xF, false);
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
         for (int j = 1; j < 20000; j++)
             res += workload(r, a, i&511, i&0xF, false);
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

