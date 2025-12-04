
import jdk.incubator.vector.*;
import java.lang.foreign.*;
import java.nio.ByteOrder;
import java.util.Random;
import java.util.Arrays;
import java.util.stream.IntStream;

/*
    Algorithmic steps (numerically stable softmax)

    Find max element:
    m = max(x)

    Subtract and exponentiate (vectorized):
    exp_shifted[i] = exp(x[i] - m)

    Sum exponentials:
    s = sum(exp_shifted)

    Normalize:
    softmax[i] = exp_shifted[i] / s

    This maps perfectly to SIMD and GPUs.
*/

public class SoftmaxBench {
    static {
        IO.println("Loading libSoftmaxNative.so...");
        System.loadLibrary("SoftmaxNative");
    }

    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    public static void vapi_kernel(MemorySegment pred, MemorySegment input, int n) {
        int len = (int)(input.byteSize() / Float.BYTES);
        float max = Float.NEGATIVE_INFINITY;
        int i = 0;
        
        // -------- PASS 1: find max (with tail) --------
        for (i = 0; i < FSP.loopBound(len); i += FSP.length()) {
            FloatVector vec = FloatVector.fromMemorySegment(FSP, input, i * Float.BYTES, ByteOrder.nativeOrder());
            max = Math.max(vec.reduceLanes(VectorOperators.MAX), max);
        }
        if (i < len) {
            VectorMask<Float> mask = FSP.indexInRange(i, len);
            FloatVector vec = FloatVector.fromMemorySegment(FSP, input, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
            max = Math.max(vec.reduceLanes(VectorOperators.MAX, mask), max);
        }
        
        // -------- PASS 2: compute exp(x - max) into pred (with tail) --------
        for (i = 0; i < FSP.loopBound(len); i += FSP.length()) {
            FloatVector vec = FloatVector.fromMemorySegment(FSP, input, i * Float.BYTES, ByteOrder.nativeOrder());
            vec = vec.lanewise(VectorOperators.SUB, max)
                     .lanewise(VectorOperators.EXP);
            vec.intoMemorySegment(pred, i * Float.BYTES, ByteOrder.nativeOrder());
        }
        if (i < len) {
            VectorMask<Float> mask = FSP.indexInRange(i, len);
            FloatVector vec = FloatVector.fromMemorySegment(FSP, input, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
            vec = vec.lanewise(VectorOperators.SUB, max)
                     .lanewise(VectorOperators.EXP);
            vec.intoMemorySegment(pred, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
        }
        
        // -------- PASS 3: sum the exponentials (with tail) --------
        float sum = 0.0f;
        for (i = 0; i < FSP.loopBound(len); i += FSP.length()) {
            FloatVector vec = FloatVector.fromMemorySegment(FSP, pred, i * Float.BYTES, ByteOrder.nativeOrder());
            sum += vec.reduceLanes(VectorOperators.ADD);
        }
        if (i < len) {
            VectorMask<Float> mask = FSP.indexInRange(i, len);
            FloatVector vec = FloatVector.fromMemorySegment(FSP, pred, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
            sum += vec.reduceLanes(VectorOperators.ADD, mask);
        }
        
        // handle pathological case (all -inf masked out) defensively
        if (sum == 0.0f) sum = Float.MIN_VALUE;
        
        // -------- PASS 4: normalize (with tail) --------
        for (i = 0; i < FSP.loopBound(len); i += FSP.length()) {
            FloatVector vec = FloatVector.fromMemorySegment(FSP, pred, i * Float.BYTES, ByteOrder.nativeOrder());
            vec = vec.lanewise(VectorOperators.DIV, sum);
            vec.intoMemorySegment(pred, i * Float.BYTES, ByteOrder.nativeOrder());
        }
        if (i < len) {
            VectorMask<Float> mask = FSP.indexInRange(i, len);
            FloatVector vec = FloatVector.fromMemorySegment(FSP, pred, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
            vec = vec.lanewise(VectorOperators.DIV, sum);
            vec.intoMemorySegment(pred, i * Float.BYTES, ByteOrder.nativeOrder(), mask);
        }
    }

    public static void ffm_kernel(MemorySegment pred, MemorySegment input, int n) {
        SoftmaxNative_h.compute_softmax(pred, input, n);
    }

    interface MicroBM {
        public void apply(MemorySegment pred, MemorySegment input, int n);
    }

    public static void runBM(String msg, MemorySegment pred, MemorySegment input, int n, MicroBM func) {
        for (int i = 0; i < 10000; i++) {
            func.apply(pred, input, n);
        }
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
            func.apply(pred, input, n);
        }
        long end = System.currentTimeMillis();
        IO.println("[" + msg + " TIME] " + (end - start) + "ms");
        IO.println("[pred] " + Arrays.toString(Arrays.copyOfRange(pred.toArray(ValueLayout.JAVA_FLOAT), 0, 8)));
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        int size = Integer.parseInt(args[1]);
        Random rd = new Random(34);
        try (Arena arena = Arena.ofShared()) {
            MemorySegment input = arena.allocate(Float.BYTES * size);
            MemorySegment pred = arena.allocate(Float.BYTES * size);
            IntStream.range(0, size).forEach(i -> {input.set(ValueLayout.JAVA_FLOAT, Float.BYTES * i, rd.nextFloat());});
            if (algo == 0 || algo == -1) { 
                runBM(" VAPI ", pred, input, size, (p,i,s)-> vapi_kernel(p, i, s));         
            }
            if (algo == 1 || algo == -1) {
                runBM(" FFM ", pred, input, size, (p,i,s)-> ffm_kernel(p, i, s));         
            }
            if (algo == 2 || algo == -1) {
                //runBM(" HWI ", pred, input, size, (p,i)-> hwi_kernel(p, i));         
            }
        }
    }
}
