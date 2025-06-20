
import java.util.Random;

class test {
  public static final int LEN = 1024;

  public static byte workload(byte [] dst, byte [] src, int cnt, boolean print) {
    // Exercises both the conditions of disjoint arrays ( cnt=0:15 (src + copy_length < dst) , cnt=32:63 (dst < src)
    //System.arraycopy(src, cnt, src, 32,  cnt);

    // AVX3-64bytes masked operations.
    System.arraycopy(src, 0, dst, 0, cnt);
    System.arraycopy(src, 64 , dst, 64 , cnt);
    System.arraycopy(src, 128 , dst, 128, cnt);
    System.arraycopy(src, 192 , dst, 192, cnt);

/*
    if (print) {
     System.out.println("Length : " + cnt);
     for(int i = 0; i < src.length; i++)
        System.out.println(src[i]);
    }
*/
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

        for (int i = 0 ; i < 900000 ; i++)
           res += workload(r, a, i&0x3F, false);
     }

     {
       long time1 = System.nanoTime();
       int res = 0;
       for (int i = 0; i < 100000; i++) {
/*
          if ((i&0x3F) == 0) {
            for (int j = 0 ; j < LEN; j++) {
               a[j] = (byte)ro.nextInt();
               r[j] = 0;
             }
          }
*/
          res += workload(r, a, i&0x1F, false);
       }
       long time2 = System.nanoTime();
/*
       for(int i = 0 ; i < LEN ; i++)
          System.out.println("Res =  " + res);
*/
       System.out.println("[Time] " + (time2-time1) + " ns : Res =  " + res);
     }
  }
}

