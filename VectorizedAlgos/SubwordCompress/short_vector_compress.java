

import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class short_vector_compress {
    public static final VectorSpecies<Short> SSP = ShortVector.SPECIES_256;
    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

    public static void micro_opt(short [] res, short [] src, long mask, int idx) {
        var sv = ShortVector.fromArray(SSP, src, idx);
        var iv0 = sv.castShape(ISP, 0);
        var iv1 = sv.castShape(ISP, 1);
        var cv0 = iv0.compress(VectorMask.fromLong(ISP, mask & 0xFF));
        var cv1 = iv1.compress(VectorMask.fromLong(ISP, (mask & 0xFF00) >> 8));
        var cv0s = cv0.convertShape(VectorOperators.I2S, SSP, 0);
        var cv1s = cv1.convertShape(VectorOperators.I2S, SSP, 0);
        int tc_low_vec = Long.bitCount((mask & 0xFF));
        var shuf_hi = SSP.iotaShuffle(-tc_low_vec, 1, false);
        long mask_hi = ((1L << tc_low_vec) - 1)  << tc_low_vec;
        var shuf_cv1s = cv1s.rearrange(shuf_hi, VectorMask.fromLong(SSP, mask_hi));
        cv0s.lanewise(VectorOperators.OR, shuf_cv1s)
            .reinterpretAsShorts()
            .intoArray(res, idx);
    }

    public static void micro_baseline(short [] res, short [] src, long mask, int idx) {
        ShortVector.fromArray(SSP, src, idx)
                   .compress(VectorMask.fromLong(SSP, mask))
                   .intoArray(res, idx);
    }

    interface BenchMark {
        public void apply(short [] res, short [] src, long mask, int idx);
    }

    public static void runBM(String msg, BenchMark bm, short [] res, short [] src, long mask) {
        for (int i = 0; i < 100000; i++) {
            for (int j = 0; j < SSP.loopBound(src.length); j += SSP.length()) {
                bm.apply(res, src, mask, j);
            }
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            for (int j = 0; j < SSP.loopBound(src.length); j += SSP.length()) {
                bm.apply(res, src, mask, j);
            }
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time] " + (t2 - t1) + " ms  [res] " + Arrays.hashCode(res));
    }

    public static void main(String [] args) {
        short [] src = new short [2048];
        short [] res = new short [2048];

        IntStream.range(0, src.length).forEach(i -> {src[i] = (short)i;}); 

        if (Integer.parseInt(args[0]) == 0) {
            runBM("baseline", (r, s, m, i) -> micro_baseline(r, s, m, i), res, src, 0x3333); 
        } else {
            runBM("withopt", (r, s, m, i) -> micro_opt(r, s, m, i), res, src, 0x3333); 
        }
    }
}
