

public class test_ea_array {
    public static float micro(int ctr) {
        float [] arr = new float[8];
        // Full loop unrolling forwards the initializing values to array index expressions.
        // otherwise, allocation is not scalar replicable
        for (int i = 0; i < 8; i++) {
            arr[i] = (float)i;
        }
        return arr[0] + arr[7] + (float)ctr;
    }

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 1; i < 100000; i++) {
            res += micro(i);
        }
        System.out.println("[res] " + res);
    }
}
