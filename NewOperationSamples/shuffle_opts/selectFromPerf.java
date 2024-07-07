
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class selectFromPerf {

    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

    // Dismantle selectFrom 
    //  1. Vector.toShuffle() : VectorCast[SILFD]2X (Byte) : [4+ cycles on AVX512, more on legacy targets].
    //  2. Rearrange.checkIndex.toVector : VectorShuffle.toVector() : VectorCastB2[SILFD] : [3-5 cycles on AVX512 and legacy targets].
    //  3. Rearrange.checkIndex.compare  : Vector.compare : if lane < ZERO : partially wrapped exceptional index, throw Exception. : 3 cycles
    //  4. Rearrange.checkIndex.VectorMask.allTrue(): Multicycles (OPMASK + REG : 3 cycles + compare / flag effecting and)
    //  5. Rearrange 

    // Notes: toShuffle not only down casts vector lanes to a byte lane, but also partially wraps the indices to detect OOB scenario by subsequent checkIndexes.
    // There is some scope of optimization in VectorShuffle.checkIndexes, we can remove costly shuffle to vector conversion and directly compare byte vector containing
    // shuffle indices for exceptional / OOB indices.
    public static void selectFrom(int [] res, int [] src, int [] idx) {
        Vector<Integer> vs = IntVector.fromArray(ISP, idx, 0);
        for (int i = 0; i < ISP.loopBound(src.length); i += ISP.length()) {
            var va = IntVector.fromArray(ISP, src, i);
            var vc = vs.selectFrom(va).reinterpretAsInts();
            vc.intoArray(res, i);
        }
    }

    public static void main(String [] args) {
       int [] src = IntStream.range(0, 4096).toArray(); 
       int [] res = new int[4096];
       int [] idx = {0, 2, 4, 6, 7, 0, 2, 4};
       for (int i = 0; i < 200000; i++) {
           selectFrom(res, src, idx);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 200000; i++) {
           selectFrom(res, src, idx);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
    }
}

