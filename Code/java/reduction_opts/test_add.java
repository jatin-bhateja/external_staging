
import jdk.incubator.vector.*;
import java.util.Random;

public class test_add {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;
  public static int micro1(int [] arr) {
     // 
     //     Res
     //      |    [AddReductionVI]
     //      |           |
     //      |           |
     //      V           |
     //     Phi <----- AddI <-|   
     //      |                |
     //      |                |
     //      ------------------
     //      |
     // 
 
     int res = 0;
     for (int i = 0; i < SPECIES.loopBound(arr.length); i+= SPECIES.length()) {
        res += IntVector.fromArray(SPECIES, arr, i)
                        .reduceLanes(VectorOperators.ADD);
     }
     return res;
  }

  public static int micro2(int [] arr) {
     int res = 0;
     for (int i = 0; i < arr.length; i++) {
        res += arr[i] * 10;
     }
     return res;
  }

  public static void main(String [] args) {
     Random r = new Random(1024);
     int algo = Integer.parseInt(args[0]);
     int [] arr = new int[Integer.parseInt(args[1])];
     for (int i = 0; i < arr.length; i++) {
         arr[i] = r.nextInt();
     }
     
     if ( algo == 0 ) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
           res = micro1(arr);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
           res = micro1(arr);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time vapi]  " + (t2 - t1) + " ms  [res] " + res);
     } else {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
           res = micro2(arr);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
           res = micro2(arr);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time]  " + (t2 - t1) + " ms  [res] " + res);
     }
  }
}
