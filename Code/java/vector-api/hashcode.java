
import java.util.Arrays;

public class hashcode {
    public static int micro() {
        int[] a = { 10, 20, 30, 40, 50, 60};
        return Arrays.hashCode(a);
    }

    public static void main(String [] args) {
        int res = 0;
        for (int i = 0; i < 10000; i++) {
            res += micro();
        }
        System.out.println("PASS:" +  res);
    }
}
