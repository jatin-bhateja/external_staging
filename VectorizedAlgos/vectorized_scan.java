import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class vectorized_scan {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_512;

   public static void scan_serial(float [] res, float [] src) {
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

   public static void simd_scan_algo1(float [] res, float [] src) {
       // For purpose of illustration assuming 256 bit FloatVector input
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

       FloatVector vres = FloatVector.broadcast(FSP, 0.0f);
       for (int i = 0; i < FSP.loopBound(res.length); i += FSP.length()) {
           long mask = (1L << FSP.length()) -1;
           FloatVector vec1 = FloatVector.fromArray(FSP, src, i);
           for (int j = 0 ; j < FSP.length() ; j++) {
              vres = vec1.expand(VectorMask.fromLong(FSP, mask))
                         .lanewise(VectorOperators.ADD, vres);
              mask <<= 1;
           }
           vres.intoArray(res, i);
           vres = FloatVector.broadcast(FSP, res[i + FSP.length() -1]);
       }
   }

   public Vector<E> scanLanes_Paul(VectorOperators.Associative op, VectorMask<E> m, ETYPE leftInput) {
      ETYPE[] a = this.toArray();
      var partial = leftInput;
      var noLanesSet = VectorMask.fromLong(species(), 0);
      var leftId = this.reduceLanes(op, noLanesSet);
      //var leftId = VectorOperations.leftIdentity(op); // hypothetical API
      for (int i = 0; i < a.length; i++) {
        if (m.laneIsSet(i)) partial = leftId;
        var ai = a[i];
        ai = this.broadcast(partial).lanewise(op, this.broadcast(ai)).lane(0);
        //ai = VectorOperations.execute(op, partial, ai); // hypothetical API
        a[i] = ai;
        partial = ai;
      }
      return fromArray(a);
    }

   // TBD: https://www.intel.com/content/www/us/en/developer/articles/technical/optimize-scan-operations-explicit-vectorization.html
   public static void simd_scan_algo2(float [] res, float [] src) {

   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);

       float [] res = new float[4096];
       float [] src = new float[4096];
       IntStream.range(0, 4096).forEach(i -> {src[i] = (float)i;});

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
       
       Arrays.fill(res, 0.0f);

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
   }
}
