
import java.util.Random;

public class maskcmp {
    static int tcnt = 0;
    static int fcnt = 0;
    static final int RANGE = 1024;
    static final int ITER  = 10_000;
    public static Random r = new Random(1024);

    public static short[] dataFa = new short[RANGE];
    public static short[] dataFb = new short[RANGE];
    public static float[] dataFc1 = new float[RANGE];
    public static float[] dataFc2 = new float[RANGE];
    public static float[] dataFc3 = new float[RANGE];
    public static float[] dataFc4 = new float[RANGE];
    public static short[] dataFc5 = new short[RANGE];
    public static float[] dataFc6 = new float[RANGE];

    static void init(short[] dataF, boolean flip) {
        for (int i = 0; i < RANGE; i++) {
            dataF[i] = flip ? (short)(RANGE - i) : (short)i;   // Opts Interplay: Profile , unswitching.
        }
        /*
        if (flip) {
            dataF[0] = Float.NaN;
            dataF[3] = Float.NaN;
            dataF[9] = Float.NaN;
        } else {
            dataF[1] = Float.NaN;
            dataF[3] = Float.NaN;
            dataF[19] = Float.NaN;
        }*/
    }

    static void test() {
        for (int i = 0; i < RANGE; i++) {
//            dataFc1[i] = (dataFa[i] != dataFb[i]) ?  1.0f : 2.0f;
//            dataFc2[i] = (dataFa[i] == dataFb[i]) ?  1.0f : 2.0f;
//            dataFc3[i] = (dataFa[i] > dataFb[i])  ?  1.0f : 2.0f;
//            dataFc4[i] = (dataFa[i] < dataFb[i])  ?  1.0f : 2.0f;
            dataFc5[i] = (dataFa[i] >= dataFb[i]) ?  (short)1 : (short)2;
        }
    }

    public static void main(String[] args) {
        init(dataFa, false);
        init(dataFb, true);
        for (int i = 0; i < ITER; i++) {
            test();
        }
        double res = 0.0;
        for (int i = 0; i < dataFc1.length; i++) {
            res += dataFc1[i];
        } 
        for (int i = 0; i < dataFc2.length; i++) {
            res += dataFc2[i];
        } 
        for (int i = 0; i < dataFc3.length; i++) {
            res += dataFc3[i];
        } 
        for (int i = 0; i < dataFc4.length; i++) {
            res += dataFc4[i];
        } 
        for (int i = 0; i < dataFc5.length; i++) {
            res += dataFc5[i];
        } 
        for (int i = 0; i < dataFc6.length; i++) {
            res += dataFc6[i];
        } 
        System.out.println("[res] " + res + " [tcnt]  " + tcnt + " [fcnt] " + fcnt);
        for (int i = 0; i < 16; i++) {
           System.out.print(dataFc6[i] + "\n");
        }
    }
}

