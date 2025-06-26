public class test_ndd {
    public static long micro(long a, long b, long c) {
       return a + b * c;
    }
    public static void main(String [] args) {
       long res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(i , i + 10, i + 30);
       }
       System.out.println("[res] " + res);
    }
}
