
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.IntStream;
import java.util.Arrays;
import jdk.incubator.vector.*;
import static jdk.incubator.vector.VectorShuffle.iota;
import static jdk.incubator.vector.VectorOperators.*;
import jdk.incubator.vector.VectorSpecies;

public class test_slice {

    public static final VectorSpecies<Byte> BYTE_SPECIES = ByteVector.SPECIES_PREFERRED;
    public static final VectorSpecies<Integer> INT_SPECIES  = IntVector.SPECIES_PREFERRED;
    public static final VectorShuffle<Integer> FOUR_BYTES_FORWARD_SHIFT = iota(INT_SPECIES, INT_SPECIES.elementSize() - 1, 1, true);
    private static final int THREE_BYTES_SIZE = Byte.SIZE * 3;
    public static final ByteVector bvzero = ByteVector.broadcast(BYTE_SPECIES, 0);

    public static int previousFourUtf8Bytes = 0;

    public static void micro1(byte [] dbuffer, byte [] sbuffer) {
        for (int offset = 0; offset < BYTE_SPECIES.loopBound(sbuffer.length); offset += BYTE_SPECIES.length()) {
            ByteVector chunk = ByteVector.fromArray(BYTE_SPECIES, sbuffer, offset);
            IntVector chunkAsInts = chunk.reinterpretAsInts();
            IntVector chunkWithPreviousFourBytes = chunkAsInts
                            .rearrange(FOUR_BYTES_FORWARD_SHIFT)
                            .withLane(0, previousFourUtf8Bytes);
            // Shift the current input forward by one byte to include one byte from the previous chunk.
            ByteVector previousOneByte = chunkAsInts
                        .lanewise(LSHL, Byte.SIZE)
                        .or(chunkWithPreviousFourBytes.lanewise(LSHR, THREE_BYTES_SIZE))
                        .reinterpretAsBytes();
            previousOneByte.intoArray(dbuffer, offset);
            previousFourUtf8Bytes = chunkAsInts.lane(INT_SPECIES.length() - 1);
        }
    }

    public static void micro2(byte [] dbuffer, byte [] sbuffer) {
        ByteVector previousChunk = ByteVector.broadcast(BYTE_SPECIES, 0); 
        for (int offset = 0; offset < BYTE_SPECIES.loopBound(sbuffer.length); offset += BYTE_SPECIES.length()) {
            ByteVector chunk = ByteVector.fromArray(BYTE_SPECIES, sbuffer, offset);
            ByteVector previousOneByte = previousChunk.slice(BYTE_SPECIES.length() - 1, chunk);  
            previousOneByte.intoArray(dbuffer, offset);
            previousChunk = chunk;
        }
    }

    interface MicroInterface {
        public void apply(byte [] dst, byte [] buffer);
    }

    public static void benchmark(String msg, MicroInterface bm, byte [] dbuffer, byte [] sbuffer) {
        for (int i = 0; i < 1000000; i++) {
            bm.apply(dbuffer, sbuffer);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            bm.apply(dbuffer, sbuffer);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[" + msg + " time] " + (t2 - t1) + " ms  [res] " + Arrays.hashCode(dbuffer));
    }

    public static void main(String [] args) {
        byte [] sbuffer = new byte[1024];
        byte [] dbuffer = new byte[1024];
        IntStream.range(0, sbuffer.length).forEach(i -> {sbuffer[i] = (byte)ThreadLocalRandom.current().nextInt();});
        benchmark("micro optimized", (s, d) -> micro2(s, d), sbuffer, dbuffer);
        benchmark("micro baseline", (s, d) -> micro1(s, d), sbuffer, dbuffer);
    }
}
