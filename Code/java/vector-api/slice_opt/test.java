
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test {
    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;
    public static int idx = 4;

    public static void micro_slice_constant_index(int [] dst, int [] src1, int [] src2) {
        for (int i = 0; i < ISP.loopBound(dst.length); i += ISP.length()) {
            IntVector.fromArray(ISP, src1, i)
                     .slice(ISP.length() >> 1, IntVector.fromArray(ISP, src2, i))
                     .intoArray(dst, i); 
        }
    }

    public static void micro_slice_non_constant_index(int [] dst, int [] src1, int [] src2) {
        for (int i = 0; i < ISP.loopBound(dst.length); i += ISP.length()) {
            IntVector.fromArray(ISP, src1, i)
                     .slice(idx, IntVector.fromArray(ISP, src2, i))
                     .intoArray(dst, i); 
        }
    }

    public static void main(String [] args) {
        int [] src1 = IntStream.range(0, 2048).toArray();
        int [] src2 = IntStream.range(0, 2048).toArray();
        int [] dst = new int[2048];

        for (int i = 0; i < 100000; i++) {
            micro_slice_non_constant_index(dst, src1, src2);
        }

        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            micro_slice_non_constant_index(dst, src1, src2);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, ISP.length())));
    } 
}
