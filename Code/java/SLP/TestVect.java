public class TestVect { 
    public static void main(String[] args) { 
        System.out.println("Speed: " + count() + " ops/s"); 
    } 

    static final int NUM = 1024; 
    static final int LIM = 100000; 
    static byte[] data = new byte[NUM], 
                  data2 = new byte[NUM], 
                  data3 = new byte[NUM]; 
    static short[] data4 = new short[NUM], 
                  data5 = new short[NUM], 
                  data6 = new short[NUM];
    static int[] data7 = new int[NUM], 
                  data8 = new int[NUM], 
                  data9 = new int[NUM];

    public static double count() { 
        /* Warmup */
        for (int i = 0; i < 12000; i++) { 
            doit2(); 
        } 
        long time1, time0 = System.nanoTime(); 
        for (int i = 0; i < LIM; i++) { 
            doit2(); 
        } 
        time1 = System.nanoTime(); 
        return (double)(time1-time0); 
    } 

    public static void doit2() { 
        for (int i = 0; i < NUM; i++) { 
            //data[i] = (byte)(data2[i] + data3[i]); 
            //data4[i] = (short)(data5[i] + data6[i]); 
            data7[i] = data8[i] + data9[i];
        } 
    } 
} 
