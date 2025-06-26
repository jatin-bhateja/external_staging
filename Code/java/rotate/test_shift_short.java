
import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test_shift_short {

   public static final int SIZE = 2048;

   public static final VectorSpecies<Short> ISP = ShortVector.SPECIES_PREFERRED;

   public static void micro1(short [] res, short [] src, short [] indexes) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ShortVector.fromArray(ISP, src, i)
                    .lanewise(VectorOperators.LSHL, 10)
                    .intoArray(res, i);
       }
   }

   public static void micro2(short [] res, short [] src, short index) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ShortVector.fromArray(ISP, src, i)
                    .lanewise(VectorOperators.LSHR, index)
                    .intoArray(res, i);
       }
   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       short [] res     = new short[SIZE];
       short [] src     = new short[SIZE];
       IntStream.range(0, SIZE).forEach(i -> src[i] = (short)i);
       short [] indexes = src;

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
