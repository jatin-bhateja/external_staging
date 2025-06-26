
import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test_rotate_short {

   public static final int SIZE = 2048;

   public static final VectorSpecies<Short> ISP = ShortVector.SPECIES_PREFERRED;

   public static final VectorMask<Short> MASK = VectorMask.fromLong(ISP, -1);
   // 
   // Variable scalar shift count : Optimized   AVX2  AVX512
   // Immediate scalar shift count : Optimized  AVX2  AVX512
   // Variable vector shift count : Optimized AVX512 , TBD AVX2
   //
   public static void micro1(short [] res, short [] src, short [] index) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ShortVector.fromArray(ISP, src, i)
                    .lanewise(VectorOperators.ROR, ShortVector.fromArray(ISP, index, 0), MASK)
                    //.lanewise(VectorOperators.ROR, shift_count_ror)
                    //.lanewise(VectorOperators.ROR, 8)
                    .intoArray(res, i);
       }
   }

   public static void micro2(short [] res, short [] src, short index) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ShortVector.fromArray(ISP, src, i)
                    .lanewise(VectorOperators.ROR, index)
                    .intoArray(res, i);
       }
   }

   // input1 = -10, input2 = -32768, mask = true
   //  input1 = -10, input2 = 3

   public static int shift_count_ror = 32767;

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       short [] res     = new short[SIZE];
       short [] src     = new short[SIZE];
       short [] indexes = new short[SIZE];
       IntStream.range(0, SIZE).forEach(i -> src[i] = (short)-10);
       IntStream.range(0, SIZE).forEach(i -> indexes[i] = (short)3);

       if (algo == 0) {
           for (int i = 0; i < 1000000; i++) {
              micro1(res, src, indexes);
           }

           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 1000000; i++) {
              micro1(res, src, indexes);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       } else {
           for (int i = 0; i < 1000000; i++) {
              micro2(res, src, indexes[i & (SIZE-1)]);
           }

           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 1000000; i++) {
              micro2(res, src, indexes[i & (SIZE-1)]);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
   }
}
