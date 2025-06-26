
import jdk.incubator.vector.*;
import java.util.stream.*;
import java.util.Arrays;

public class vector_hash {

    static final int  SIZE = 4096;
    static long [] accumulators;
    static byte [] input;
    static byte [] SECRET;

    static VectorShuffle<Long> LONG_SHUFFLE_PREFERRED = VectorShuffle.fromOp(LongVector.SPECIES_PREFERRED, i -> i ^ 1);

    public static void Setup() {
        accumulators = new long[SIZE];
        input = new byte[SIZE * 8];
        SECRET = new byte[SIZE * 8];
        IntStream.range(0, SIZE * 8).forEach(
            i -> {
                     input[i] = (byte)i;
                     SECRET[i] = (byte)-i;
                 }
        );
    }

    public static void hashingKernel() {
        for (int block = 0; block < input.length / 1024; block++) {
            for (int stripe = 0; stripe < 16; stripe++) {
                int inputOffset = block * 1024 + stripe * 64;
                for (int i = 0; i < 8; i += LongVector.SPECIES_PREFERRED.length()) {
                    LongVector accumulatorsVector = LongVector.fromArray(LongVector.SPECIES_PREFERRED, accumulators, i);
                    LongVector key = ByteVector.fromArray(ByteVector.SPECIES_PREFERRED, input, inputOffset + i * 8).reinterpretAsLongs();
                    LongVector low = key.and(0xFFFF_FFFFL);
                    //LongVector high = key.lanewise(VectorOperators.LSHR, 32);
                    LongVector high = key.lanewise(VectorOperators.AND, 0xFFFF_FFFFL);

                    accumulatorsVector
                            .add(high.mul(low))
                            .intoArray(accumulators, i);
                }
            }
        }
    }
    
    public static void main(String [] args) {
        Setup();
        for (int i = 0; i < 10000; i++) {
            hashingKernel();
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
            hashingKernel();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2-t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(accumulators, 0, 16)));
    }
}
