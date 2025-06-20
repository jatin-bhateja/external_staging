
import jdk.incubator.vector.*;

public class test {

    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_512;

    public static int indexOf_vec(byte [] haystack, byte [] needle) {
        assert needle.length < BSP.length();
        int pos = 0;
        ByteVector first = ByteVector.broadcast(BSP, needle[0]);
        ByteVector last = ByteVector.broadcast(BSP, needle[needle.length - 1]);
        VectorMask<Byte> nmask = VectorMask.fromLong(BSP, (1 << needle.length) - 1);
        ByteVector nvec = ByteVector.fromArray(BSP, needle, 0, nmask);
        while (pos + BSP.length() < haystack.length) {
            ByteVector slice1 = ByteVector.fromArray(BSP, haystack, pos);
            ByteVector slice2 = ByteVector.fromArray(BSP, haystack, pos + needle.length - 1,
                                                     VectorMask.fromLong(BSP, (1L << (BSP.length() - ((pos + needle.length) & (BSP.length() - 1)))) - 1));             
            VectorMask<Byte> mask =  slice1.compare(VectorOperators.EQ, first)
                                           .and(slice2.compare(VectorOperators.EQ, last));
            int idx = 0;
            int truecount = mask.trueCount();
            while (truecount > 0) {
                idx = mask.firstTrue();
                if (idx + needle.length > BSP.length()) {
                   break;
                }
                // Compare haystack[pos + idx] with needle.
                // FIXME: Special case handling for 1, 15 bytes comparison.
                if (nvec.compare(VectorOperators.EQ, ByteVector.fromArray(BSP, haystack, pos + idx, nmask)).allTrue()) {
                   return pos + idx;
                }
                truecount--;
            }
            pos += truecount == 0 ? BSP.length() : idx;
        }
        return -1;
    }
 
    public static int indexOf_new(String haystack, String needle) {
        if (needle.length() < BSP.length()) {
           return indexOf_vec(haystack.getBytes(), needle.getBytes());
        } else {
           return haystack.indexOf(needle);
        }
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
 
        String haystack = "Looks like it ran in container/VM with HotSpot seeing only these flags set (avx512f, avx512cd) based on attached hs_err file CPU: total 12 (initial active 12) (6 cores per cpu, 2 threads per core) family 6 model 106 stepping 6 microcode 0x1, cx8, cmov, fxsr, ht, mmx, 3dnowpref, sse, sse2, sse3, ssse3, sse4.1, sse4.2, popcnt, lzcnt, tsc, avx, avx2, aes, erms, clmul, bmi1, bmi2, adx, avx512f, avx512cd, sha, fma, clflush, hv, rdtscp, rdpid, f16c, pku, ospke We've only seen this four times since February, so it seems to be highly intermittent. [~jbhateja] did you try running it in a loop without a fixed StressSeed? I wouldn't rip out the old implementation. I have been wondering if we should make the older implementation available, maybe by security property. I was looking at the static Maps at the top of ECOperations, forParameters, and the constructors where it checks if the montgomeryOps was null or set. It would be nice if we could have one set of fields Maps by putting the montgomery entry into the fields to replace it. I think that should work because IntegerMontgomeryFieldModuloP extends IntegerFieldModuloP. instanceof or other montgomeryOps checks would still need to exist because not all the fields support mongomery, and the older implementation would still be accessible for your fuzz tester. At least that is my theory.";
        String needle = "accessible";

        long res = 0;
        if (algo == 0 || algo == -1) {
            for (int i = 0; i < 100000; i++) {
                res += indexOf_new(haystack, needle);
            }
            long t1 = System.currentTimeMillis();
            for (int i = 0; i < 100000; i++) {
                res += indexOf_new(haystack, needle);
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time vapi] " + (t2 - t1) + " ms  [res] " + res); 
        }
        
        if (algo == 1 || algo == -1) {
            res = 0;
            for (int i = 0; i < 100000; i++) {
                res += haystack.indexOf(needle);
            }
            long t1 = System.currentTimeMillis();
            for (int i = 0; i < 100000; i++) {
                res += haystack.indexOf(needle);
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time baseline] " + (t2 - t1) + " ms  [res] " + res); 
        }
    }
}

