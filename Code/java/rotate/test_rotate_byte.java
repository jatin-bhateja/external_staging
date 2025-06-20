import java.util.Arrays;
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test_rotate_byte {

   public static final int SIZE = 4096;

   public static final VectorSpecies<Byte> ISP = ByteVector.SPECIES_PREFERRED;

   // Case1 : Immediate shift. redundant source unpacking AVX2 AVX512
   // Case2 : Scalar Variable shift redundant source unpacking   AVX2 AVX512
   // Case3 : Vector Variable shift redundant source unpacking AVX2 AVX512  
   public static int shift_count_byte = 5;
   public static void micro1(byte [] res, byte [] src, byte [] indexes) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ByteVector.fromArray(ISP, src, i)
                    //.lanewise(VectorOperators.ROL, ByteVector.fromArray(ISP, indexes, i))
                    //.lanewise(VectorOperators.ROL, 5)
                    .lanewise(VectorOperators.ROL, shift_count_byte)
                    .intoArray(res, i);
       }
   }

   public static void micro2(byte [] res, byte [] src, byte index) {
       int i = 0;
       for (; i < ISP.loopBound(res.length); i += ISP.length()) {
           ByteVector.fromArray(ISP, src, i)
                    .lanewise(VectorOperators.ROL, index)
                    .intoArray(res, i);
       }
   }

   public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       byte [] res     = new byte[SIZE];
       byte [] src     = new byte[SIZE];
       IntStream.range(0, SIZE).forEach(i -> src[i] = (byte)i);
       byte [] indexes = src;

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
