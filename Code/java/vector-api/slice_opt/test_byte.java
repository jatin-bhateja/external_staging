
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test_byte {
    public static final VectorSpecies<Byte> ISP = ByteVector.SPECIES_PREFERRED;
    public static int idx = 4;

    public static void micro_slice_constant_index(byte [] dst, byte [] src1, byte [] src2) {
        for (int i = 0; i < ISP.loopBound(dst.length); i += ISP.length()) {
            ByteVector.fromArray(ISP, src1, i)
                     .slice(ISP.length() >> 1, ByteVector.fromArray(ISP, src2, i))
                     .intoArray(dst, i); 
        }
    }

    public static void micro_slice_non_constant_index(byte [] dst, byte [] src1, byte [] src2) {
        for (int i = 0; i < ISP.loopBound(dst.length); i += ISP.length()) {
            ByteVector.fromArray(ISP, src1, i)
                     .slice(idx, ByteVector.fromArray(ISP, src2, i))
                     .intoArray(dst, i); 
        }
    }

    public static void main(String [] args) {
        byte [] src1 = new byte[2048];
        byte [] src2 = new byte[2048];
        byte [] dst = new byte[2048];
        IntStream.range(0, 2048).forEach(i -> {src1[i] = (byte)i;});
        IntStream.range(0, 2048).forEach(i -> {src2[i] = (byte)(i * 10);});

        for (int i = 0; i < 100000; i++) {
            micro_slice_constant_index(dst, src1, src2);
        }

        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            micro_slice_constant_index(dst, src1, src2);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, ISP.length())));
    } 
}
