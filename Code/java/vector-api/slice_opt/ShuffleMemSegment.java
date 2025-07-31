
import jdk.incubator.vector.*;
import java.lang.foreign.*;
import java.util.Arrays;
import java.nio.*;

public class ShuffleMemSegment {
    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_256;

    public static void micro(int [] dst, int [] indexes) {
        MemorySegment sms = MemorySegment.ofArray(indexes);
        MemorySegment dms = MemorySegment.ofArray(indexes);
        var shuffle = VectorShuffle.fromMemorySegment(BSP, sms, 0, ByteOrder.nativeOrder());
        shuffle.intoMemorySegment(dms, 0, ByteOrder.nativeOrder());
    }

    public static void main(String [] args) {
        int [] src = {
            1,2,3,4,5,6,7,8,
            1,2,3,4,5,6,7,8,
            1,2,3,4,5,6,7,8,
            1,2,3,4,5,6,7,8,
        };
        int [] dst = new int[32];

        for (int i = 0; i < 100000; i++) {
            micro(dst, src);
        }
        System.out.println("[src] " + Arrays.toString(src));
        System.out.println("[dst] " + Arrays.toString(dst));
    }
}