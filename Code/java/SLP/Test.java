public class Test {
    static int N = 512;

    public static void main(String[] strArr) {
        double[] data1 = new double[N];
        short[] data2 = new short[N];
        init(data1, data2);
        for (int i = 0; i < 10_000; i++){
            test(data1, data2);
        }
    }

    static void test(double[] data1, short[] data2) {
        for (int i = 16; i < N-16; i++) {
            short v = data2[i + 2];
            data2[i] = v;
            data1[i] = (double)v;
        }
    }

    static void init(double[] data1, short[] data2) {
        for (int j = 0; j < N; j++) {
            data1[j] = (double)j;
            data2[j] = (short)j;
        }
    }
}
