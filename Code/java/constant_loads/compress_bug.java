
public class compress_bug {
    public static int micro(int value) {
       // Popcount (mask) = max_value
       // Popcount of mask can be computed only for a constant mask
       // 1) Estimating the max popcount over a range of values is expensive,
       // but accurately estimates the upper bound of compressing result.
       // 2) Result will always be less than the upper bound of mask if mask
       // lies in +ve value range.
       // 3) Value range compaction is a very powerful optimization and
       // compliments dead code eliminations.
       return Integer.compress(0, Integer.min(10000, Integer.max(value, 20)));
    }
    public static void main(String [] args) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro(i);
        }
        System.out.println("[res] " + res);
    }
}
