
import jdk.incubator.vector.*;
import java.util.Arrays;

public class scatter {
  public static long micro(long [] res, long [] arr, int [] index, int ctr) {
     LongVector.fromArray(LongVector.SPECIES_256, arr, 0)
              .intoArray(res, 0, index, 0);
     return res[ctr];
  }
  public static void main(String [] args) {
     int val = 0;
     long [] res = new long[1024];
     long [] arr = new long[1024];
     Arrays.fill(arr, 10);
     int [] idx = new int[8];
     for(int i = 0; i < LongVector.SPECIES_256.length(); i++) {
       idx[i] = i * 2;
     }
     for(int i = 0; i < 100000; i++) {
       val += micro(res, arr, idx, i & 1023);
     }
     System.out.println("[Res] = " + val);
  }
} 
