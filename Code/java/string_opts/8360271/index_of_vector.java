
import jdk.incubator.vector.*;
import java.util.Arrays;

public class index_of_vector {
    public static VectorSpecies<Byte> BSP = ByteVector.SPECIES_PREFERRED;

    public static int find_vector(int spos, byte [] haystack, byte [] needle) {
        if (needle.length > haystack.length) {
            return -1;
        }

        if ((spos + needle.length) > haystack.length) {
            return -1;
        }

        int sch_idx = 0;
        int ech_idx = needle.length > BSP.length() ?
                          BSP.length()  - 1:
                          needle.length - 1;

        byte sch = needle[sch_idx];
        byte ech = needle[ech_idx];
        int i = 0;
        for (; i < BSP.loopBound(haystack.length) - BSP.length(); i += BSP.length()) {
            ByteVector srcvec1 = ByteVector.fromArray(BSP, haystack, i + spos);
            ByteVector srcvec2 = ByteVector.fromArray(BSP, haystack, i + spos + ech_idx);
            VectorMask<Byte> smask = srcvec1.compare(VectorOperators.EQ, sch);
            VectorMask<Byte> emask = srcvec2.compare(VectorOperators.EQ, ech);
            VectorMask<Byte> hopmask = smask.and(emask);
            while (hopmask.anyTrue()) {
                int pos  = hopmask.firstTrue();
                if (Arrays.equals(haystack, i + spos + pos, i + spos + pos + needle.length, needle, 0, needle.length)) {
                    return i + spos + pos;
                }
                hopmask = hopmask.andNot(VectorMask.fromLong(BSP, 1L << pos));
            }
        }
        if (i < haystack.length) {
            VectorMask<Byte> mask = BSP.indexInRange(i + spos, haystack.length);
            ByteVector srcvec1 = ByteVector.fromArray(BSP, haystack, i + spos, mask);
            mask = BSP.indexInRange(i + spos + ech_idx , haystack.length);
            ByteVector srcvec2 = ByteVector.fromArray(BSP, haystack, i + spos + ech_idx, mask);
            VectorMask<Byte> smask = srcvec1.compare(VectorOperators.EQ, sch);
            VectorMask<Byte> emask = srcvec2.compare(VectorOperators.EQ, ech);
            VectorMask<Byte> hopmask = smask.and(emask);
            while (hopmask.anyTrue()) {
                int pos  = hopmask.firstTrue();
                if (Arrays.equals(haystack, i + spos + pos, i + spos + pos + needle.length, needle, 0, needle.length)) {
                    return i + spos + pos;
                }
                hopmask = hopmask.andNot(VectorMask.fromLong(BSP, 1L << pos));
            }
        }
        return -1;
    }


    public static int find_stock(int spos, byte [] haystack, byte [] needle) {
        String h = new String(haystack);
        String n = new String(needle);
        return h.indexOf(n, spos);
    }

    interface BMKernel {
        public int apply(int spos, byte[] haystack, byte [] needle);
    }

    public static void runBM(String msg, int spos, byte[] haystack, byte[] needle, BMKernel micro) {
        long res = 0;
        for (int i = 0; i < 10000000; i++) {
            res += micro.apply(spos, haystack, needle);
        }
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro.apply(spos, haystack, needle);
        }
        long end = System.currentTimeMillis();
        IO.println("[ " + msg + " time] " + (end - start) + " ms  [res] " + res);
    }

    public static void main(String [] args) {
        // String haystack = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        // String needle = "aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbb";
        String haystack = "aaaaaaaaaaaaaaaaaaaaaaddddddddddddddd";
        String needle = "ad";
        int algo = Integer.parseInt(args[0]);
        if (algo == 0) {
            runBM("stock", 20, haystack.getBytes(), needle.getBytes(), (p, h, n) -> find_stock(p, h, n));
        } else {
            runBM("vector", 20, haystack.getBytes(), needle.getBytes(), (p, h, n) -> find_vector(p, h, n));
        }
    }
}

/*
PROMPT>java --add-modules=jdk.incubator.vector -cp . index_of_vector 0
WARNING: Using incubator modules: jdk.incubator.vector
[ stock time] 654 ms  [res] 420000000
PROMPT>java --add-modules=jdk.incubator.vector -cp . index_of_vector 1
WARNING: Using incubator modules: jdk.incubator.vector
[ vector time] 119 ms  [res] 420000000
*/
