import java.util.Arrays;

class test {

    static void dont_inline() {
    }

    static int i = 1;

    public static void main(String[] args) {
        int[] a = new int[200];
        for (int j = 0; j < 200000; j++) {
            //     int b = i;
            Arrays.fill(a, 1);
            //Arrays.fill(a, 1+b);
            dont_inline();
        }
    }
}

