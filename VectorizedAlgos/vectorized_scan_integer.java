import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class vectorized_scan_integer {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_512;

   public static void scan_serial(int [] res, int [] src) {
       int running_sum  = 0;
       for (int i = 0; i < res.length; i++) {
          // Every iteration adds one element to memoized sum.
          running_sum += src[i];
          res[i] = running_sum; 
          // Cost per iteration 
          //  - 1 Load (src[i])
          //  - 1 Add
          //  - 1 Store
       }
       // 16 elements = 16 Loads + 16 Stores + 16 Additions.
   }

   public static void simd_scan_algo1(int [] res, int [] src) {
       // For purpose of illustration assuming 256 bit IntVector input
       // with eight vector lanes.
       //
       // Iter[0:VECLEN)   Input Vector      Expand mask      Output
       // ------------------------------------------------------------------
       //         0      A B C D E F G H    0x11111111     A B C D E F G H
       //         1      A B C D E F G H    0x11111110       A B C D E F G
       //         2      A B C D E F G H    0x11111100         A B C D E F
       //         3      A B C D E F G H    0x11111000           A B C D E
       //         4      A B C D E F G H    0x11110000             A B C D
       //         5      A B C D E F G H    0x11100000               A B C
       //         6      A B C D E F G H    0x11000000                 A B
       //         7      A B C D E F G H    0x10000000                   A
       //===================================================================
       //  Add the expanded input vector produced after every iteration
       //  to get final vector scan result.
       //===================================================================                    
       //
       // In order to perform the scan over arrays whose length is greater
       // than the vector length, broadcast last lane of resultant vector of
       // previous scan operation and add it to input vector of current scan
       // operation before commencing scan iterations.
       // 
       //   [ SCAN1 ] [ SCAN2 ] [ SCAN3 ] [ SCAN4 ]
       //          V   A     V   A     V   A
       //          |___|     |___|     |___|
       //

       IntVector vres = IntVector.broadcast(ISP, 0);
       for (int i = 0; i < ISP.loopBound(res.length); i += ISP.length()) {
           long mask = (1L << ISP.length()) -1;
           IntVector vec1 = IntVector.fromArray(ISP, src, i);
           for (int j = 0 ; j < ISP.length() ; j++) {
              vres = vec1.expand(VectorMask.fromLong(ISP, mask))
                         .lanewise(VectorOperators.ADD, vres);
              mask <<= 1;
           }
           vres.intoArray(res, i);
           vres = IntVector.broadcast(ISP, res[i + ISP.length() -1]);
       }
   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);

       int [] res = new int[4096];
       int [] src = new int[4096];
       IntStream.range(0, 4096).forEach(i -> {src[i] = (int)i;});


       if (algo == 1 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               simd_scan_algo1(res, src);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               simd_scan_algo1(res, src);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[vector time] " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
       Arrays.fill(res, 0);

       if (algo == 0 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               scan_serial(res, src);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               scan_serial(res, src);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[scalar time] " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
       
   }
}
