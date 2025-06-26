class fillb {
    public static final int SIZE = 1024;
    public static byte fillByteArray(int ctr) {
        byte[] res = new byte[SIZE];
        for (int i = 0; i < SIZE; i++) {
            res[i] = (byte) 10;
        }
        return res[ctr];
    }
    public static void main(String [] args) {
        long res = 0;
        for(int i = 0; i < 10000; i++) {
           res += fillByteArray(i & 1023);
        }
        System.out.println(res);
    }
}
