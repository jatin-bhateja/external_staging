import java.util.Arrays;
import java.util.Random;

public class TestDeopt {

    public static void main(String[] args) throws Exception {
        int MAX = 2147483647; // 2^32 - 1
        float fraction = Float.parseFloat(args[0]);
        int size = (int) (fraction * MAX); // size is a fraction of the MAX size
        int iters = Integer.parseInt(args[1]); // number of iterations
        int max = args.length > 2 ? Integer.parseInt(args[2]) : -1 ; // max value for the array elements

        for (int i = 0; i < iters; i++) {
            boolean isSorted = runSort(size, max);
            System.out.println("Iteration " + i + ": is sorted? -> "+ isSorted);
            if (!isSorted) throw new Exception("Test Failed: Array is not properly sorted!");
        }
    }

    static boolean runSort(int size, int max) {
        int[] a = new int[size];
        int[] a_copy = new int[a.length];
        Random rand = new Random();
        for (int i=0; i< a.length; i++) a[i] =  max > 0 ? rand.nextInt(max) : rand.nextInt();
        // call parallel sort
        Arrays.parallelSort(a);
        // check if sorted
        boolean isSorted = true;
        for (int i = 0; i < (a.length -1); i++) isSorted = isSorted && (a[i] <= a[i+1]);
        return isSorted;
    }
}
