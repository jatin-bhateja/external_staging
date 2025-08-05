
import java.util.concurrent.ThreadLocalRandom;

public class test_ctz {

    public static final long lb = ThreadLocalRandom.current().nextLong(10000); 
    public static final long ub = ThreadLocalRandom.current().nextLong(10000); 

    public static long micro(long param) {
        long constrained_param = Math.min(ub, Math.max(param, lb));
        return Long.numberOfLeadingZeros(constrained_param);
    }

    public static void main(String [] args) {
        long res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro(i);
        }
        System.out.println("[res] " + res);
    }
}
