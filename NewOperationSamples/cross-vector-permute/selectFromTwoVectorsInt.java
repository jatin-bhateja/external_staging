
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class selectFromTwoVectorsInt {
    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

    public static void micro1(int [] res, int [] src1, int [] src2, int [] idx) {
        for (int i = 0; i < ISP.loopBound(res.length); i += ISP.length()) {
            IntVector vidx = IntVector.fromArray(ISP, idx, i);
            if (vidx.compare(VectorOperators.UNSIGNED_GE, ISP.length() * 2).anyTrue()) {
                throw new IndexOutOfBoundsException("OOB" + "[" + i + "," + (i + ISP.length()) + ")");
            }
            IntVector.fromArray(ISP, src1, i)
                       .rearrange(vidx.toShuffle(), IntVector.fromArray(ISP, src2, i))
                       .intoArray(res, i);
        }
    }

    public static void micro2(int [] res, int [] src1, int [] src2, int [] idx) {
        for (int i = 0; i < ISP.loopBound(res.length); i += ISP.length()) {
            IntVector vidx = IntVector.fromArray(ISP, idx, i);
            IntVector vsrc1 = IntVector.fromArray(ISP, src1, i);
            IntVector vsrc2 = IntVector.fromArray(ISP, src2, i);
            vidx.selectFrom(vsrc1, vsrc2)
                .intoArray(res, i);
        }
    }

    public static void micro3(int [] res, int [] src1, int [] src2, int [] idx) {
        for (int i = 0; i < ISP.loopBound(res.length); i += ISP.length()) {
            IntVector vidx = IntVector.fromArray(ISP, idx, i);
            IntVector vsrc1 = IntVector.fromArray(ISP, src1, i);
            IntVector vsrc2 = IntVector.fromArray(ISP, src2, i);
            vsrc1.rearrange(vidx.toShuffle(), vsrc2)
                .intoArray(res, i);
        }
    }

    public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       int [] idx = new int[4096];
       int [] idx_bs = new int[4096];
       int ISP_LEN_M1 = ISP.length() - 1;
       int [] src1 = IntStream.range(0, 4096).toArray();
       int [] src2 = IntStream.range(4096, 4096*2).toArray();
       IntStream.range(0, 4096).forEach( i -> {idx[i] = (i % 2 == 0) ? (int)(i & ISP_LEN_M1): (int)((i & ISP_LEN_M1) + ISP.length());});
       System.arraycopy(idx, 0, idx_bs, 0, idx.length);
   
       if (algo == 0 || algo == -1) {
           int [] res = new int[4096];
           for (int i = 0; i < 100000 ; i++) {
               micro1(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000 ; i++) {
               micro1(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time micro1] " + (t2-t1) + " ms   [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
       if (algo == 1 || algo == -1) {
           int [] res = new int[4096];
           for (int i = 0; i < 100000 ; i++) {
               micro2(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000 ; i++) {
               micro2(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time micro2] " + (t2-t1) + " ms   [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
       if (algo == 2 || algo == -1) {
           int [] res = new int[4096];
           for (int i = 0; i < 100000 ; i++) {
               micro3(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000 ; i++) {
               micro3(res, src1, src2, idx);
               System.arraycopy(idx_bs, 0, idx, 0, idx.length);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time micro3] " + (t2-t1) + " ms   [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
       }
    }
}   
