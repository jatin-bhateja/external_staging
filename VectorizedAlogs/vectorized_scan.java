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

   public static void scan_parallel_algo1(float [] res, float [] src) {
       // Perm Table:
       // A B C D E F G H
       //   A B C D E F G
       //     A B C D E F
       //       A B C D E
       //         A B C D
       //           A B C
       //             A B
       //               A
       //
       //   - Algorithm:
       //     INDEX =  IOTA
       //     ONEV = BCAST(1)
       //     DST = BCAST(0)
       //     Loop_Over_Rest : (INCR=FSP.length())
       //        SRC =  LoadVector SRC
       //        TEMP = PERM SRC INDEX    | Alternative
       //        INDEX = INDEX +  ONEV    | -> Use VECTOR EXPAND with progressively right shifting of mask
       //        DST = ADD SRC DST (MASK) |
       //        
       //        Propagate the result of last vector lane across vector loop iterations.  
       //        [ VRES1  ] [VRES2   ]  [VRES3 ]  [VRES4  ]
       //                V   A       V   A     V   A
       //                |___|       |___|     |___|
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


   // TBD: https://www.intel.com/content/www/us/en/developer/articles/technical/optimize-scan-operations-explicit-vectorization.html
   public static void scan_parallel_algo2(float [] res, float [] src) {

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
               scan_parallel_algo1(res, src);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               scan_parallel_algo1(res, src);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[vector time] " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
   }
}
