import java.util.Random;
import jdk.internal.vm.annotation.*;

public class test2 {
    private static final Random RANDOM = new Random();

    @Stable
    public static short [] arr;

    public test2() {
        arr = new short[1024];
        for (int i  = 0; i < arr.length; i++) {
            arr[i] = (short)RANDOM.nextInt();
        }
    }

    public static void main(String[] args) {
        long res = 0;
        test2 obj = new test2();
        for (int i = 0; i < 10000; i++) {
           res += obj.testFolding(); 
        }
        System.out.println("[res]" + res);
    }

    public short testFolding() {
        return arr[10];
    }
}
