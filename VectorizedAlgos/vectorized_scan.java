import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class vectorized_scan {
   public static final VectorSpecies<Double> DSP = DoubleVector.SPECIES_512;

   public static void scan_serial(double [] res, double [] src) {
       double running_sum  = 0.0;
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

   /* Algorithm Description:-
      Input                     :  A      B     C   D      E    F     G    H
      Shuf1                     :  0      0     2   2      4    4     6    6
      Mask1                     :  0      1     0   1      0    1     0    1
      TMP1 = Shuf1(Input).Mask1 :  A    (A+B)   C  (C+D)   E  (F+E)   G   (G+H)
      
      Shuf2                     :  0      0     1          1      4    4      5          5
      Mask2                     :  0      0     1          1      0    0      1          1
      TMP2 = Shuf2(TMP1).Mask2  :  A    (A+B)  (A+B+C) (A+B+C+D)  E    (E+F) (E+F+G)  (E+F+G+H)
      
      Shuf3                     :  0      0     1          1         3           3            3                3
      Mask3                     :  0      0     0          0         1           1            1                1
      TMP3 = Shuf3(TMP2).Mask3  :  A    (A+B)  (A+B+C) (A+B+C+D)  (A+B+C+D+E)  (A+B+C+DE+F) (A+B+C+D+E+F+G)  (A+B+C+D+E+F+G+H)
   */

   public static final VectorShuffle<Double> SHUF1 = VectorShuffle.fromValues(DSP, 0, 0, 2, 2, 4, 4, 6, 6);
   public static final VectorShuffle<Double> SHUF2 = VectorShuffle.fromValues(DSP, 0, 0, 1, 1, 4, 4, 5, 5);
   public static final VectorShuffle<Double> SHUF3 = VectorShuffle.fromValues(DSP, 0, 0, 0, 0, 3, 3, 3, 3);
   public static final VectorMask<Double> MASK1 = VectorMask.fromLong(DSP, 0xAA);
   public static final VectorMask<Double> MASK2 = VectorMask.fromLong(DSP, 0xCC);
   public static final VectorMask<Double> MASK3 = VectorMask.fromLong(DSP, 0xF0);

   // Ref: https://www.intel.com/content/www/us/en/developer/articles/technical/optimize-scan-operations-explicit-vectorization.html
   public static void simd_scan_algo1(double [] res, double [] src) {
       DoubleVector init = DoubleVector.broadcast(DSP, 0.0);
       for (int i = 0; i < DSP.loopBound(src.length); i += DSP.length()) {
           DoubleVector vec0 = DoubleVector.fromArray(DSP, src, i);
           var vec1 = vec0.rearrange(SHUF1, MASK1); 
           var vec2 = vec1.lanewise(VectorOperators.ADD, vec0); 
           var vec3 = vec2.rearrange(SHUF2, MASK2); 
           vec2 = vec3.lanewise(VectorOperators.ADD, vec2); 
           vec3 = vec2.rearrange(SHUF3, MASK3); 
           vec2 = vec3.lanewise(VectorOperators.ADD, vec2); 
           vec2 = vec2.lanewise(VectorOperators.ADD, init);
           init = DoubleVector.broadcast(DSP, res[i + DSP.length() - 1]);
           vec2.intoArray(res, i);
       }
   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       double [] res = new double[4096];
       double [] src = new double[4096];
       IntStream.range(0, 4096).forEach(i -> {src[i] = (double)i;});

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

       Arrays.fill(res, 0.0f);

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
