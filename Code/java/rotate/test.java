import java.util.Random;

public class test {
    private static final Random random = new Random(1024);
    private static final int ARRLEN = 512;
    private static final int ITERS = 11000;

    private static byte[] arrByte = new byte[ARRLEN];
    private static byte[] rolByte = new byte[ARRLEN];
    private static byte[] rorByte = new byte[ARRLEN];
    private static byte   resByte = 0;

    private static short[] arrShort = new short[ARRLEN];
    private static short[] rolShort = new short[ARRLEN];
    private static short[] rorShort = new short[ARRLEN];
    private static short   resShort = 0;

    public static void main(String[] args) {
        System.out.println("warmup");
        warmup();

        System.out.println("Testing...");
        runRotateLeftByteTest();
        runRotateRightByteTest();
        runRotateLeftShortTest();
        runRotateRightShortTest();

        System.out.println("PASSED");
    }

    static void warmup() {
        random.nextBytes(arrByte);
        randomShorts();
        for (int i = 0; i < ITERS; i++) {
            testRotateLeftByte(rolByte, arrByte, i);
            testRotateRightByte(rorByte, arrByte, i);
            testRotateLeftShort(rolShort, arrShort, i);
            testRotateRightShort(rorShort, arrShort, i);
        }
    }

    static void randomShorts() {
        for (int i = 0; i < ARRLEN; i++) {
            arrShort[i] = (short) random.nextInt();
        }
    }

    static void runRotateLeftByteTest() {
        for (int shift = 0; shift < 64; shift++) {
            random.nextBytes(arrByte);
            testRotateLeftByte(rolByte, arrByte, shift);
            for (int i = 0; i < ARRLEN; i++) {
                resByte = (byte) ((arrByte[i] << shift) | (arrByte[i] >>> -shift));
                if (rolByte[i] != resByte) {
                    throw new RuntimeException("rol value = " + arrByte[i] + ", shift = " + shift + ", error: " + "expect " + resByte + " but result is " + rolByte[i]);
                }
            }
        }
    }

    static void runRotateRightByteTest() {
        for (int shift = 0; shift < 64; shift++) {
            random.nextBytes(arrByte);
            testRotateRightByte(rorByte, arrByte, shift);
            for (int i = 0; i < ARRLEN; i++) {
                resByte = (byte) ((arrByte[i] >>> shift) | (arrByte[i] << -shift));
                if (rorByte[i] != resByte) {
                    throw new RuntimeException("ror value = " + arrByte[i] + ", shift = " + shift + ", error: " + "expect " + resByte + " but result is " + rorByte[i]);
                }
            }
        }
    }

    static void runRotateLeftShortTest() {
        for (int shift = 0; shift < 64; shift++) {
            randomShorts();
            testRotateLeftShort(rolShort, arrShort, shift);
            for (int i = 0; i < ARRLEN; i++) {
                resShort = (short) ((arrShort[i] << shift) | (arrShort[i] >>> -shift));
                if (rolShort[i] != resShort) {
                    throw new RuntimeException("rol value = " + arrShort[i] + ", shift = " + shift + ", error: " + "expect " + resShort + " but result is " + rolShort[i]);
                }
            }
        }
    }

    static void runRotateRightShortTest() {
        for (int shift = 0; shift < 64; shift++) {
            randomShorts();
            testRotateRightShort(rorShort, arrShort, shift);
            for (int i = 0; i < ARRLEN; i++) {
                resShort = (short) ((arrShort[i] >>> shift) | (arrShort[i] << -shift));
                if (rorShort[i] != resShort) {
                    throw new RuntimeException("ror value = " + arrShort[i] + ", shift = " + shift + ", error: " + "expect " + resShort + " but result is " + rorShort[i]);
                }
            }
        }
    }

    static void testRotateLeftByte(byte[] test, byte[] arr, int shift) {
        for (int i = 0; i < ARRLEN; i++) {
            test[i] = (byte) ((arr[i] << shift) | (arr[i] >>> -shift));
        }
    }

    static void testRotateRightByte(byte[] test, byte[] arr, int shift) {
        for (int i = 0; i < ARRLEN; i++) {
            test[i] = (byte) ((arr[i] >>> shift) | (arr[i] << -shift));
        }
    }

    static void testRotateLeftShort(short[] test, short[] arr, int shift) {
        for (int i = 0; i < ARRLEN; i++) {
            test[i] = (short) ((arr[i] << shift) | (arr[i] >>> -shift));
        }
    }

    static void testRotateRightShort(short[] test, short[] arr, int shift) {
        for (int i = 0; i < ARRLEN; i++) {
            test[i] = (short) ((arr[i] >>> shift) | (arr[i] << -shift));
        }
    }
}
