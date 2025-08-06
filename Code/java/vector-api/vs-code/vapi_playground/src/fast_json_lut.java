
import jdk.incubator.vector.*;
import java.util.concurrent.*;

public class fast_json_lut {
    public static VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;

    // With new Vector.selectFrom API we can declare 128 byte
    // lookup tables.
    public static byte [] generate_new_lookup_table() {
        byte [] lut = new byte[128];
        // 0x2c  ->   1
        lut[0x2c]  = 1;
        // 0x3a  ->   2
        lut[0x3a]  = 2;
        // 0x5b
        // 0x5d  ->   4
        // 0x7b
        // 0x7d
        lut[0x5b]  = 4;
        lut[0x5d]  = 4;
        lut[0x7b]  = 4;
        lut[0x7d]  = 4;
        // 0x09
        // 0x0a  ->   8
        // 0x0d
        lut[0x09]  = 8;
        lut[0x0a]  = 8;
        lut[0x0d]  = 8;
        // 0x20  ->   16
        lut[0x20]  = 16;
        return lut;
    }

    public static byte [] lut_new = generate_new_lookup_table();

    public static long match_optimized(byte [] str) {
        long matches = 0;
        ByteVector vlut1 = ByteVector.fromArray(B512, lut_new, 0);
        ByteVector vlut2 = ByteVector.fromArray(B512, lut_new, 64);
        for (int i = 0; i < B512.loopBound(str.length); i += B512.length()) {
            ByteVector index = ByteVector.fromArray(B512, str, i);
            ByteVector res = index.selectFrom(vlut1, vlut2);
            VectorMask<Byte> valid_index = index.compare(VectorOperators.LE, (byte)0x7d);
            VectorMask<Byte> res_mask = res.compare(VectorOperators.GT, 0);
            matches += res_mask.and(valid_index).trueCount();
        }
        return matches;
    }

    // 16 byte lookup tables for different JSON structural code points.
    public static byte [][] generate_old_lookup_tables() {
        // 0x09
        // 0x0a  ->   8
        // 0x0d
        byte [] lut1 = new byte[32];
        lut1[0x9] = 8;
        lut1[0xa] = 8;
        lut1[0xd] = 8;
        lut1[0x10] = 8;
        // 0x20  ->   16
        byte [] lut2 = new byte[32];
        lut2[0] = 16;
        lut2[0x12] = 16;
        // 0x5b
        // 0x5d  ->   4
        // 0x7b
        // 0x7d
        byte [] lut3 = new byte[32];
        lut3[0xb] = 4;
        lut3[0xd] = 4;
        lut3[0x15] = 4;
        lut3[0x17] = 4;
        // 0x3a  ->   2
        byte [] lut4 = new byte[32];
        lut4[0x13] = 2;
        lut4[0xa] = 2;
        // 0x2c  ->   1
        byte [] lut5 = new byte[32];
        lut5[0x12] = 1;
        lut5[0xc] = 1;
        byte [][] lut = new byte[5][];
        lut[0] = lut1;
        lut[1] = lut2;
        lut[2] = lut3;
        lut[3] = lut4;
        lut[4] = lut5;
        return lut;
    }

    public static VectorSpecies<Byte> B128 = ByteVector.SPECIES_128;

    public static byte [][] lut_old = generate_old_lookup_tables();

    public static long match_current(byte [] str) {
        long matches = 0;
        ByteVector lut1_lo = ByteVector.fromArray(B128, lut_old[0], 0);
        ByteVector lut1_hi = ByteVector.fromArray(B128, lut_old[0], 16);
        ByteVector lut2_lo = ByteVector.fromArray(B128, lut_old[1], 0);
        ByteVector lut2_hi = ByteVector.fromArray(B128, lut_old[1], 16);
        ByteVector lut3_lo = ByteVector.fromArray(B128, lut_old[2], 0);
        ByteVector lut3_hi = ByteVector.fromArray(B128, lut_old[2], 16);
        ByteVector lut4_lo = ByteVector.fromArray(B128, lut_old[3], 0);
        ByteVector lut4_hi = ByteVector.fromArray(B128, lut_old[3], 16);
        ByteVector lut5_lo = ByteVector.fromArray(B128, lut_old[4], 0);
        ByteVector lut5_hi = ByteVector.fromArray(B128, lut_old[4], 16);
        for (int i = 0; i < B128.loopBound(str.length); i += B128.length()) {
            ByteVector vsrc = ByteVector.fromArray(B128, str, i);
            VectorMask<Byte> index_mask = vsrc.compare(VectorOperators.LE, 0x7d);
            VectorShuffle<Byte> index_lo = vsrc.lanewise(VectorOperators.AND, 0xF)
                                               .toShuffle();
            VectorShuffle<Byte> index_hi = vsrc.lanewise(VectorOperators.LSHR, 4)
                                               .toShuffle();
            ByteVector lookup_lut1 = lut1_lo.rearrange(index_lo).lanewise(VectorOperators.AND, lut1_hi.rearrange(index_hi));
            matches += lookup_lut1.compare(VectorOperators.GT, 0).and(index_mask).trueCount();

            ByteVector lookup_lut2 = lut2_lo.rearrange(index_lo).lanewise(VectorOperators.AND, lut2_hi.rearrange(index_hi));
            matches += lookup_lut2.compare(VectorOperators.GT, 0).and(index_mask).trueCount();

            ByteVector lookup_lut3 = lut3_lo.rearrange(index_lo).lanewise(VectorOperators.AND, lut3_hi.rearrange(index_hi));
            matches += lookup_lut3.compare(VectorOperators.GT, 0).and(index_mask).trueCount();

            ByteVector lookup_lut4 = lut4_lo.rearrange(index_lo).lanewise(VectorOperators.AND, lut4_hi.rearrange(index_hi));
            matches += lookup_lut4.compare(VectorOperators.GT, 0).and(index_mask).trueCount();

            ByteVector lookup_lut5 = lut5_lo.rearrange(index_lo).lanewise(VectorOperators.AND, lut5_hi.rearrange(index_hi));
            matches += lookup_lut5.compare(VectorOperators.GT, 0).and(index_mask).trueCount();
        }
        return matches;
    }

    interface MicroBench {
        public long apply(byte [] str);
    }

    public static void BenchMark(String msg, MicroBench bm, byte [] str) {
        long res = 0;
        for (int i = 0; i < 50000; i++) {
            res += bm.apply(str);
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 50000; i++) {
            res += bm.apply(str);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time] " + (t2 - t1) + " ms  [res] " + res);
    }

    public static void main(String [] args) {
        byte [] str = new byte[128];
        byte [] codepoints = {(byte)0x9, (byte)0xa, (byte)0xd, (byte)0x20, (byte)0x5b,
                              (byte)0x5d, (byte)0x7b, (byte)0x7d, (byte)0x3a, (byte)0x2c};
        for (int i = 0; i < 32; i++) {
            int idx = ThreadLocalRandom.current().nextInt(str.length);
            int cidx = ThreadLocalRandom.current().nextInt(codepoints.length);
            str[idx] = codepoints[cidx];
        }

        BenchMark("match_curent", (s) -> match_current(s), str);
        BenchMark("match_optimized", (s) -> match_optimized(s), str);
    }
}