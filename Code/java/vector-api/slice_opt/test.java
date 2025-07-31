
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test {
    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_PREFERRED;

    public static void micro(byte [] dst, byte [] src) {
        ByteVector.fromArray(BSP, src, 0)
                  .slice(7)
                  .intoArray(dst, 0); 
    }

    public static void main(String [] args) {
        byte [] src = new byte[64];
        byte [] dst  = new byte[64];
        IntStream.range(0, 64).forEach(i -> src[i] = (byte)i);

        for (int i = 0; i < 100000; i++) {
            micro(dst, src);
        }

        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            micro(dst, src);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, BSP.length())));
    } 
}
