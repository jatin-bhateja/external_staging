import java.util.stream.IntStream;
import java.util.Arrays;

public class loop_structure {
    public static void micro(int [] arr, int arr2[], int cond) {
        for (int i = 0; i < arr.length; i++) {
            if (cond > 10000) {
               arr[i] = 10;
            }
            arr2[i] = 204;
        }
    }

    public static void main(String [] args) {
        int [] arr = new int[1024];
        int [] arr2 = new int[1024];
        for (int i = 0; i < 20000; i++) {
            micro(arr, arr2, i);
        }
        System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(arr, 0, 16)));
        System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(arr2, 0, 16)));
    }
}
