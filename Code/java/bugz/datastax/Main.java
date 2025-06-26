import jdk.incubator.vector.ByteVector;

import java.lang.foreign.MemorySegment;
import java.nio.ByteOrder;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.IntStream;

public class Main {
    public static void main(String[] args) {
        AtomicLong aLong = new AtomicLong();

        IntStream.range(0, 50000000).forEach(j -> {
            byte[] bytes = new byte[64];
            ThreadLocalRandom.current().nextBytes(bytes);
            var byteSegment = MemorySegment.ofArray(bytes);
            var byteFragment = ByteVector.SPECIES_PREFERRED.fromMemorySegment(byteSegment, 0, ByteOrder.LITTLE_ENDIAN);
            float[] floats = new float[128];
            byte[] targetBytes = new byte[512];
            var floatSegment = MemorySegment.ofArray(floats);
            var targetByteSegment = MemorySegment.ofArray(targetBytes);
            byteFragment.intoMemorySegment(floatSegment, ThreadLocalRandom.current().nextInt(0, 448), ByteOrder.LITTLE_ENDIAN);
            byteFragment.intoMemorySegment(targetByteSegment, ThreadLocalRandom.current().nextInt(0, 448), ByteOrder.LITTLE_ENDIAN);
            var l = 0;
            for (int i = 0; i < floats.length; i++) {
                l += (int) floats[i];
            }
            aLong.addAndGet(l);
        });

        System.out.println(aLong.get());
    }
}
