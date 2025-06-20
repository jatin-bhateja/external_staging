import java.util.Arrays;
import jdk.incubator.vector.*;

class rce {
  public static final int ITER = 100000;
  public static final int LENGTH = 16384;
  public static int micro1(int [] res, int [] arr, int ctr) {
     int i = 0;
     for(; i < arr.length-16; i+=16) {
        IntVector.fromArray(IntVector.SPECIES_512, arr, i)
                 .lanewise(VectorOperators.ADD, IntVector.SPECIES_512.broadcast(10))
                 .intoArray(res, i);
     }
     for(; i < arr.length; i++) {
           res[i] = arr[i] + 10;
     }
     return res[ctr];
  }
  public static int micro2(int [] res, int [] arr, int ctr) {
     for(int i = 0; i < arr.length; i+=16) {
        IntVector.fromArray(IntVector.SPECIES_512, arr, i)
                 .lanewise(VectorOperators.ADD, IntVector.SPECIES_512.broadcast(10))
                 .intoArray(res, i);
     }
     return res[ctr];
  }
  public static void main(String [] args) {
     int val = 0;
     int [] arr = new int[LENGTH];
     int [] res = new int[LENGTH];
     Arrays.fill(arr, 1);
     for(int i = 0; i < ITER; i++) {
        val += micro1(res, arr, i & (LENGTH-1));
     } 
     val = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < ITER; i++) {
        val += micro1(res, arr, i & (LENGTH-1));
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Micro1 Time] " + (t2-t1) + " ms  [Res] " + val);

     val = 0;
     for(int i = 0; i < ITER; i++) {
        val += micro2(res, arr, i & (LENGTH-1));
     } 
     val = 0;
     t1 = System.currentTimeMillis();
     for(int i = 0; i < ITER; i++) {
        val += micro2(res, arr, i & (LENGTH-1));
     }
     t2 = System.currentTimeMillis();
     System.out.println("[Micro2 Time] " + (t2-t1) + " ms  [Res] " + val);
  }
}
