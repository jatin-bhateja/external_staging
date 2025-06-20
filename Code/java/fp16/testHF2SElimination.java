
import jdk.incubator.vector.*;
import java.util.stream.IntStream;


public class testHF2SElimination {
    public static float micro(short [] src, int i) {
        return Float16.add(
                     Float16.add(
                          Float16.shortBitsToFloat16(src[i]),
                          Float16.shortBitsToFloat16(src[i])),
                     Float16.shortBitsToFloat16(src[i])).floatValue();
    }

    public static void main(String [] args) {
        short [] src = new short[1024];
        IntStream.range(0, src.length).forEach(i -> {src[i] = Float.floatToFloat16((float)i);});
        float res = 0;
        for (int i = 0; i < 100000; i++) {
            for (int j = 0; j < src.length; i++) {
                res += micro(src, j);
            }
        }
        System.out.println("[res] " + res);
    }
} 
