import java.util.Arrays;

// -Xcomp
public class Reduced {
    private static final int SIZE = 8192;

    public static void main(String[] args) {
        int[] input = new int[SIZE];
        int[] output = new int[SIZE];

        Arrays.fill(input, 33554433);

        for (int i = 0; i < 10; i++) {
            run(output, input);
        }

        int sentinel = Integer.numberOfLeadingZeros(33554433);

        for (int i = 0; i < output.length; i++) {
            if (output[i] != sentinel) {
                throw new IllegalStateException("Expected " + sentinel + " at idx " + i + " but got " + output[i]);
            }
        }
    }

    private static void run(int[] output, int[] input) {
        for (int i = 0; i < input.length; i++) {
            output[i] = Integer.numberOfLeadingZeros(input[i]);
        }
    }
}
