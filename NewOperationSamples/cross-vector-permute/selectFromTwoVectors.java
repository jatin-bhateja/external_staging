
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class selectFromTwoVectors {
    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;
    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

    public static void micro1(float [] res, float [] src1, float [] src2, float [] idx) {
        for (int i = 0; i < FSP.loopBound(res.length); i += FSP.length()) {
            FloatVector vidx = FloatVector.fromArray(FSP, idx, i);
            if (vidx.convert(VectorOperators.F2I, 0).compare(VectorOperators.UNSIGNED_GE, FSP.length() * 2).anyTrue()) {
                throw new IndexOutOfBoundsException("OOB" + "[" + i + "," + (i + FSP.length()) + ")");
            }
            FloatVector.fromArray(FSP, src1, i)
                       .rearrange(vidx.toShuffle(), FloatVector.fromArray(FSP, src2, i))
                       .intoArray(res, i);
        }
    }

    public static void micro2(float [] res, float [] src1, float [] src2, float [] idx) {
        for (int i = 0; i < FSP.loopBound(res.length); i += FSP.length()) {
            FloatVector vidx = FloatVector.fromArray(FSP, idx, i);
            FloatVector vsrc1 = FloatVector.fromArray(FSP, src1, i);
            FloatVector vsrc2 = FloatVector.fromArray(FSP, src2, i);
            vidx.selectFrom(vsrc1, vsrc2)
                .intoArray(res, i);
        }
    }

    public static void micro3(float [] res, float [] src1, float [] src2, float [] idx) {
        for (int i = 0; i < FSP.loopBound(res.length); i += FSP.length()) {
            FloatVector vidx = FloatVector.fromArray(FSP, idx, i);
            FloatVector vsrc1 = FloatVector.fromArray(FSP, src1, i);
            FloatVector vsrc2 = FloatVector.fromArray(FSP, src2, i);
            vsrc1.rearrange(vidx.toShuffle(), vsrc2)
                .intoArray(res, i);
        }
    }

    public static void main(String [] args) {
       int algo = Integer.parseInt(args[0]);
       float [] src1 = new float[4096];
       float [] src2 = new float[4096];
       float [] idx = new float[4096];
       float [] idx_bs = new float[4096];
       int FSP_LEN_M1 = FSP.length() - 1;
       IntStream.range(0, 4096).forEach( i -> {src1[i] = (float)i;});
       IntStream.range(0, 4096).forEach( i -> {src2[i] = (float)i + 4096.0f;});
       IntStream.range(0, 4096).forEach( i -> {idx[i] = (i % 2 == 0) ? (float)(i & FSP_LEN_M1): (float)((i & FSP_LEN_M1) + FSP.length());});
       System.arraycopy(idx, 0, idx_bs, 0, idx.length);
   
       if (algo == 0 || algo == -1) {
           float [] res = new float[4096];
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
           float [] res = new float[4096];
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
           float [] res = new float[4096];
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
