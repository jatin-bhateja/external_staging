public class Test {
    public static long[] array_0 = fill(new long[10000]);                                                                                                                                                                                  
    public static long[] array_2 = fill(new long[10000]);

    public static long[] fill(long[] a) {
        for (int i = 0; i < a.length; i++) {
            a[i] = 1;
        }
        return a;
    }

    public static long one = 1L;

    static final long[] GOLD = test();

    public static long[] test() {
        long[] out = new long[10000];
        for (int i = 0; i < out.length; i++) {
            long y = array_0[i] % one;
            long x = (array_2[i] | 4294967298L) << -7640610671680100954L;
            out[i] = Long.expand(y, x);
        }
        return out;
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10_000; i++) {
            test();
	}

        long[] res = test();
        for (int i = 0; i < 10_000; i++) {
            if (res[i] != GOLD[i]) {
                throw new RuntimeException("value mismatch: " + res[i] + " vs " + GOLD[i]);
	    }
	}
    }
}
