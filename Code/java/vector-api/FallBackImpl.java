
import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class FallBackImpl {

    public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_PREFERRED;

    static int wrapToRange(int index, int size) {
        if ((size & (size - 1)) == 0) {
            // Size is zero or a power of two, so we got this.
            return index & (size - 1);
        } else {
            return wrapToRangeNPOT(index, size);
        }
    }
    private static int wrapToRangeNPOT(int index, int size) {
        if (index >= 0) {
            return (index % size);
        } else {
            return Math.floorMod(index, Math.abs(size));
        }
    }

    public static int selectFromTwoVectorHelper1(int [] indexes, int [] src1, int [] src2) {
        int vlen = indexes.length;
        int[] vecPayload1 = indexes;
        int[] vecPayload2 = src1;
        int[] vecPayload3 = src2;
        for (int i = 0; i < vlen; i++) {
            int wrapped_index = wrapToRange((int)vecPayload1[i], 2 * vlen);
            vecPayload1[i] = wrapped_index >= vlen ? vecPayload3[wrapped_index - vlen] : vecPayload2[wrapped_index];
        }
        return IntVector.fromArray(SPECIES, vecPayload1, 0).reduceLanes(VectorOperators.ADD);
    }
    
    public static int selectFromTwoVectorHelper2(IntVector indexes, IntVector src1, IntVector src2) {
        return src1.rearrange(indexes.lanewise(VectorOperators.AND, 2 * SPECIES.length() - 1).toShuffle(), src2).reduceLanes(VectorOperators.ADD);
    }

    public static void main(String [] args) {
        int res = 0;
        int algo = Integer.parseInt(args[0]);
        int [] indexes          = IntStream.range(0, SPECIES.length()).map(i -> i * 2).toArray(); 
        int [] src1             = IntStream.range(0, SPECIES.length()).toArray();
        int [] src2             = IntStream.range(0, SPECIES.length()).map(i -> i * 10).toArray();
        
        if (algo == 0) {
            for (int i = 0; i < 1000000 ; i++) {
                int [] copyOfIndexes   = Arrays.copyOfRange(indexes, 0, SPECIES.length());
                res += selectFromTwoVectorHelper1(indexes, src1, src2);
                indexes = copyOfIndexes;
            }
            long t1 = System.currentTimeMillis();
            for (int i = 0; i < 1000000 ; i++) {
                int [] copyOfIndexes   = Arrays.copyOfRange(indexes, 0, SPECIES.length());
                res += selectFromTwoVectorHelper1(indexes, src1, src2);
                indexes = copyOfIndexes;
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
        } else {
            IntVector vidx  = IntVector.fromArray(SPECIES, indexes, 0);
            IntVector vsrc1 = IntVector.fromArray(SPECIES, src1, 0);
            IntVector vsrc2 = IntVector.fromArray(SPECIES, src2, 0);
            for (int i = 0; i < 1000000 ; i++) {
                res += selectFromTwoVectorHelper2(vidx, vsrc1, vsrc2);
            }
            long t1 = System.currentTimeMillis();
            for (int i = 0; i < 1000000 ; i++) {
                res += selectFromTwoVectorHelper2(vidx, vsrc1, vsrc2);
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
        }
    }    
}
