
import jdk.internal.vm.annotation.Stable;
import java.util.stream.IntStream;

public class constant_value {
    @Stable
    public static int [] arr;

    public static int micro(int val) {
       return arr[0] + arr[1] + arr[2] + arr[8] + arr[16] + val;
    }

    public static void main(String [] args) {
        int res = 0;
        arr = IntStream.range(0, 32).map(i -> 1).toArray();
        for (int i = 0; i < 10000; i++) {
            res += micro(i); 
        }
        System.out.println("[res] " + res);
    }
}
