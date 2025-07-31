

import jdk.incubator.vector.*;
import java.lang.foreign.*;
import java.util.Arrays;
import java.nio.*;
import java.util.stream.IntStream;

public class test_ms {
    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_256;

    public static void micro(int [] dst, int [] indexes) {
        MemorySegment sms = MemorySegment.ofArray(indexes);
        MemorySegment dms = MemorySegment.ofArray(dst);
        var shuffle = VectorShuffle.fromMemorySegment(BSP, sms, 0, ByteOrder.nativeOrder());
        shuffle.intoMemorySegment(dms, 0, ByteOrder.nativeOrder());    
    } 

    public static void main(String [] args) {
        int [] src = IntStream.range(0, 32).toArray();
        int [] dst = new int[32];

        for (int i = 0; i < 100000; i++) {
            micro(dst, src);
        }
        System.out.println("[src] " + Arrays.toString(src));
        System.out.println("[dst] " + Arrays.toString(dst));
    }
}
