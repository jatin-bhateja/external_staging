
import jdk.internal.vm.annotation.Stable;
import java.util.concurrent.ThreadLocalRandom;

public class random_constants {
    public static final int idx = ThreadLocalRandom.current().nextInt(1034);

    @Stable
    public static int [] arr;

    public static void init() {
        arr = new int[1024];
        for (int i = 0; i < 1024; i++) {
            arr[i] = ThreadLocalRandom.current().nextInt();
        }
    }
   
    public static int yeild_number() {
        return arr[idx] + 10;
    }

    public static void main(String [] args) {
        int res = 0;
        init();
        for (int i = 0; i < 100000; i++) {
            res += yeild_number();
        }
        System.out.println("[res] " + res);
    }
} 
