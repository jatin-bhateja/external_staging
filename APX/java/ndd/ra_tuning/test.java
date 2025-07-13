
public class test {
    public static long micro(long arg1, long arg2, long arg3, long arg4) {
       return arg1 + arg2 + arg3 + arg4;
    }

    public static void main(String [] args) {
        long res = 0;
        for (int i = 0; i < 10000; i++) {
            res += micro(i, i + 10, i + 20, i + 30);
        }
        System.out.println("[res] " + res);
    }
} 
