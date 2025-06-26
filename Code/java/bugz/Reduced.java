class Reduced {
    static int iArrFld[] = new int[400];

    public static void main(String[] o) {
        for (int i = 0; i < 100000; i++) {
            test();
        }
    }

    static void test() {
        int f = 1;
        for (int i = 6; i < 75; i++) {
            f += Integer.reverseBytes(iArrFld[i]++);
        }
    }
}

