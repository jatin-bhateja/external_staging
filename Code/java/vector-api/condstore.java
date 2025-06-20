
import java.util.Arrays;
import jdk.incubator.vector.*;

class condstore {
  public static int micro(int [] res, int [] arr, int cond, int ctr) {
//      if (cond == 1) {
         IntVector.fromArray(IntVector.SPECIES_512, arr, 0)
                  .intoArray(res, 0);
//      }
      return res[ctr];
  }
  public static void main(String [] args) {
     int val = 0;
     int freq = Integer.parseInt(args[0]);
     int [] arr = new int[16];
     int [] res = new int[16];
     Arrays.fill(arr, 10);

     for(int i = 0 ; i < 1000000000; i++) {
        val += micro(res, arr, i % freq,  i & 15);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 1000000; i++) {
        val += micro(res, arr, i % freq,  i & 15);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] = " + (t2-t1) + "ms  [Res] = " + val); 
  }
}
