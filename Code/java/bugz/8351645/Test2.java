public class Test2 {
    public static long[] array_0 = fill(new long[10000]);                                                                                                                                                                                  
    public static long[] fill(long[] a) {
        for (int i = 0; i < a.length; i++) {
            a[i] = 1;
        }
        return a;
    }

    static final long GOLD = test();

    public static long test() {
       return Long.expand(0L, array_0[10]);
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10_000; i++) {
            test();
	}

        long res = test();
        if (res != GOLD) {
            throw new RuntimeException("value mismatch: " + res + " vs " + GOLD);
        }
    }
}
