/*
 * VectorIntersectBench.java — Java Vector API benchmark for Vector.intersect()
 *
 * Proposed API semantics (jdk.incubator.vector):
 *   <E> VectorMask<E> Vector.intersect(Vector<E> vec)
 *
 * Returns a VectorMask<E> where lane i is set if this[i] exists in any
 * lane of 'vec'. The mask can then be used with compress/select operations
 * to extract matching elements, or with anyTrue()/trueCount() for
 * existence and cardinality queries.
 *
 * Three implementations compared:
 *   1. Scalar             — nested loop over lanes (baseline)
 *   2. Vector API rotate  — rearrange() + compare(EQ) + mask-OR emulation
 *                           (best pattern expressible with current Vector API)
 *   3. Vector.intersect() — intrinsic (VP2INTERSECTD on AVX-512)
 *
 * The rotate-and-compare emulation (Micro 2) mirrors the C micro's
 * VPERMD + VPCMPEQD pattern — this is the best a developer can achieve
 * with existing Vector API operations. The dual-rotate technique of
 * Díez-Cañas [arXiv:2112.06342] achieves much better performance in C
 * but requires in-lane shuffles (vpshufd) and 16-bit mask rotations
 * that have no Vector API equivalents.
 *
 * Usage:
 *   javac --add-modules jdk.incubator.vector VectorIntersectBench.java
 *   java  --add-modules jdk.incubator.vector \
 *         -XX:+UnlockDiagnosticVMOptions \
 *         -XX:UseAVX=3 \
 *         VectorIntersectBench
 */

import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.Random;

public class VectorIntersectBench {

    static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
    static final int LANES = I512.length();   // 16

    // Shuffle that rotates all lanes left by 1: lane i gets value from lane (i+1)%16
    static final VectorShuffle<Integer> ROTATE_LEFT_1 =
        VectorShuffle.fromOp(I512, i -> (i + 1) % LANES);

    /* ================================================================ */
    /*  Micro 1: Scalar — nested loop (leaf, 16 vs 16)                  */
    /*                                                                  */
    /*  For each element of src[srcOff..+16], scan vec[vecOff..+16].    */
    /*  Returns a 16-bit mask: bit i set means src[srcOff+i] exists     */
    /*  somewhere in vec[vecOff..vecOff+15].                            */
    /*  Worst case: 16 × 16 = 256 comparisons + branches.              */
    /* ================================================================ */

    static int intersectScalar(int[] src, int srcOff,
                               int[] vec, int vecOff) {
        int mask = 0;
        for (int i = 0; i < LANES; i++) {
            for (int j = 0; j < LANES; j++) {
                if (src[srcOff + i] == vec[vecOff + j]) {
                    mask |= (1 << i);
                    break;
                }
            }
        }
        return mask;
    }

    /* ================================================================ */
    /*  Micro 2: Vector API — rotate + compare (leaf, 16 vs 16)         */
    /*                                                                  */
    /*  vSrc stays fixed; vVec is rotated through all 16 positions.     */
    /*  compare(EQ) sets mask bit i when vSrc[i] == rotated_vVec[i],    */
    /*  so the mask always corresponds to lanes of 'this' (vSrc).      */
    /*  After ORing all 16 rotations, mask bit i = 1 means             */
    /*  "this[i] exists somewhere in vec".                              */
    /*                                                                  */
    /*  Returns: VectorMask over src lanes.                             */
    /*                                                                  */
    /*  Ideally compiles to:                                            */
    /*    16 vpcmpeqd + 15 vpermd + 15 korw                            */
    /* ================================================================ */

    static VectorMask<Integer> intersectVector(IntVector vSrc, IntVector vVec) {
        // rotation 0
        VectorMask<Integer> mask = vSrc.compare(VectorOperators.EQ, vVec);

        // rotations 1..15
        IntVector rotated = vVec;
        for (int r = 1; r < LANES; r++) {
            rotated = rotated.rearrange(ROTATE_LEFT_1);
            mask = mask.or(vSrc.compare(VectorOperators.EQ, rotated));
        }
        return mask;
    }

    /* ================================================================ */
    /*  Micro 3: Vector API — Vector.intersect() intrinsic              */
    /*                                                                  */
    /*  Uses the new Vector.intersect(Vector) API which maps directly   */
    /*  to VP2INTERSECTD on AVX-512 capable hardware.                   */
    /*  Single instruction produces a mask pair; we only need the       */
    /*  mask over src lanes.                                            */
    /*                                                                  */
    /*  Ideally compiles to: 1 vp2intersectd                            */
    /* ================================================================ */

    static VectorMask<Integer> intersectIntrinsic(IntVector vSrc, IntVector vVec) {
        return vSrc.intersect(vVec);
    }

    /* ================================================================ */
    /*  Array-level intersection: 4096 vs 4096 elements                 */
    /*                                                                  */
    /*  For each 16-element block of arrA, compare against every        */
    /*  16-element block of arrB using the leaf-level routines.         */
    /*  Collect matched elements from arrA preserving their order.      */
    /*                                                                  */
    /*  Outer loop: arrA blocks  (4096/16 = 256 blocks)                 */
    /*  Inner loop: arrB blocks  (256 blocks)                           */
    /*  Total leaf calls: 256 × 256 = 65,536                           */
    /* ================================================================ */

    static final int ARRAY_SIZE = 4096;
    static final int NUM_BLOCKS = ARRAY_SIZE / LANES;

    /**
     * Scalar array intersection.
     *
     * Fix one 16-element chunk of arrA, compare it against every
     * 16-element chunk of arrB using intersectScalar (leaf).
     * OR the per-chunk masks into an accumulator. After all arrB
     * chunks are processed, compress matching arrA elements into
     * the output preserving arrA order.
     *
     * Outer: 256 arrA chunks.  Inner: 256 arrB chunks.
     * Total leaf calls: 256 × 256 = 65,536.
     */
    static int intersectArrayScalar(int[] arrA, int[] arrB, int[] out) {
        int outPos = 0;

        for (int a = 0; a < ARRAY_SIZE; a += LANES) {
            int accumMask = 0;

            for (int b = 0; b < ARRAY_SIZE; b += LANES) {
                accumMask |= intersectScalar(arrA, a, arrB, b);
            }

            // Compact matched arrA lanes in their original order
            for (int i = 0; i < LANES; i++) {
                if ((accumMask & (1 << i)) != 0) {
                    out[outPos++] = arrA[a + i];
                }
            }
        }
        return outPos;
    }

    /**
     * Vector API array intersection.
     *
     * Fix one 16-element chunk of arrA (loaded once into vA),
     * compare it against every 16-element chunk of arrB using
     * intersectVector (leaf). OR the per-chunk VectorMasks into
     * an accumulator. After all arrB chunks, compress + store once.
     *
     * Outer: 256 arrA chunks.  Inner: 256 arrB chunks.
     * Total leaf calls: 256 × 256 = 65,536.
     */
    static int intersectArrayVector(int[] arrA, int[] arrB, int[] out) {
        int outPos = 0;

        for (int a = 0; a < ARRAY_SIZE; a += LANES) {
            IntVector vA = IntVector.fromArray(I512, arrA, a);

            VectorMask<Integer> accumMask = I512.maskAll(false);

            for (int b = 0; b < ARRAY_SIZE; b += LANES) {
                IntVector vB = IntVector.fromArray(I512, arrB, b);
                accumMask = accumMask.or(intersectVector(vA, vB));
            }

            // Compress matched arrA lanes in order, store once per arrA chunk
            vA.compress(accumMask).intoArray(out, outPos);
            outPos += accumMask.trueCount();
        }
        return outPos;
    }

    /**
     * Vector.intersect() intrinsic array intersection.
     *
     * Same structure as intersectArrayVector but uses the
     * Vector.intersect() API instead of rotate-and-compare.
     */
    static int intersectArrayIntrinsic(int[] arrA, int[] arrB, int[] out) {
        int outPos = 0;

        for (int a = 0; a < ARRAY_SIZE; a += LANES) {
            IntVector vA = IntVector.fromArray(I512, arrA, a);

            VectorMask<Integer> accumMask = I512.maskAll(false);

            for (int b = 0; b < ARRAY_SIZE; b += LANES) {
                IntVector vB = IntVector.fromArray(I512, arrB, b);
                accumMask = accumMask.or(intersectIntrinsic(vA, vB));
            }

            vA.compress(accumMask).intoArray(out, outPos);
            outPos += accumMask.trueCount();
        }
        return outPos;
    }

    /* ================================================================ */
    /*  Validation                                                      */
    /* ================================================================ */

    /**
     * Validate single-vector intersection: both leaves must produce
     * the same mask, and when compressed, the same output elements.
     */
    static boolean validate(String name, int[] src, int[] vec) {
        // Scalar leaf → mask → compress manually
        int sMask = intersectScalar(src, 0, vec, 0);
        int[] refDst = new int[LANES];
        int refCnt = 0;
        for (int i = 0; i < LANES; i++) {
            if ((sMask & (1 << i)) != 0) refDst[refCnt++] = src[i];
        }

        // Vector rotate-compare leaf → mask → compress via API
        IntVector vSrc = IntVector.fromArray(I512, src, 0);
        IntVector vVec = IntVector.fromArray(I512, vec, 0);
        VectorMask<Integer> vMask = intersectVector(vSrc, vVec);
        int[] vecDst = new int[LANES];
        vSrc.compress(vMask).intoArray(vecDst, 0);
        int vecCnt = vMask.trueCount();

        // Vector.intersect() intrinsic leaf
        VectorMask<Integer> iMask = intersectIntrinsic(vSrc, vVec);
        int[] intDst = new int[LANES];
        vSrc.compress(iMask).intoArray(intDst, 0);
        int intCnt = iMask.trueCount();

        boolean ok = (refCnt == vecCnt) &&
                     Arrays.equals(refDst, 0, refCnt, vecDst, 0, vecCnt) &&
                     (refCnt == intCnt) &&
                     Arrays.equals(refDst, 0, refCnt, intDst, 0, intCnt);

        System.out.printf("  %-36s  scalar=%d  rotate=%d  intrinsic=%d  mask=0x%04X  %s%n",
                          name, refCnt, vecCnt, intCnt, sMask, ok ? "PASS" : "**FAIL**");
        if (!ok) {
            System.out.println("    src       = " + Arrays.toString(src));
            System.out.println("    vec       = " + Arrays.toString(vec));
            System.out.println("    expected  = " + Arrays.toString(Arrays.copyOf(refDst, refCnt)));
            System.out.println("    rotate    = " + Arrays.toString(Arrays.copyOf(vecDst, vecCnt)));
            System.out.println("    intrinsic = " + Arrays.toString(Arrays.copyOf(intDst, intCnt)));
        }
        return ok;
    }

    /* ================================================================ */
    /*  Driver                                                          */
    /* ================================================================ */

    public static void main(String[] args) {
        int pass = 0, fail = 0;

        /* ---- Phase 1: Validation ---- */
        System.out.println("=== Phase 1: Validation ===\n");

        // Test 1: Mixed (12 of 16 match)
        {
            int[] s = {42,  7, 99, 13, 88,  3, 55, 21, 66, 11, 77, 31,  2, 44, 15, 70};
            int[] v = {50, 55, 33, 11,  8, 42, 15, 66, 44,  9, 21,  3, 13, 88, 70,  7};
            if (validate("Mixed (12 of 16 match)", s, v)) pass++; else fail++;
        }

        // Test 2: No overlap
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) { s[i] = i; v[i] = i + 100; }
            if (validate("No overlap", s, v)) pass++; else fail++;
        }

        // Test 3: Full overlap (identical)
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) { s[i] = i * 7 + 3; v[i] = i * 7 + 3; }
            if (validate("Full overlap (identical)", s, v)) pass++; else fail++;
        }

        // Test 4: Full overlap (reversed vec)
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) { s[i] = i + 1; v[i] = LANES - i; }
            if (validate("Full overlap (reversed)", s, v)) pass++; else fail++;
        }

        // Test 5: Single match (lane 0)
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) { s[i] = i; v[i] = i + 100; }
            v[8] = s[0];
            if (validate("Single match (lane 0)", s, v)) pass++; else fail++;
        }

        // Test 6: Single match (lane 15)
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) { s[i] = i; v[i] = i + 100; }
            v[3] = s[15];
            if (validate("Single match (lane 15)", s, v)) pass++; else fail++;
        }

        // Test 7: Alternating matches (even lanes)
        {
            int[] s = new int[LANES], v = new int[LANES];
            for (int i = 0; i < LANES; i++) {
                s[i] = i;
                v[i] = (i % 2 == 0) ? i : i + 200;
            }
            if (validate("Alternating (even lanes)", s, v)) pass++; else fail++;
        }

        // Test 8: Broadcast src=42, one match in vec
        {
            int[] s = new int[LANES], v = new int[LANES];
            Arrays.fill(s, 42);
            for (int i = 0; i < LANES; i++) v[i] = i + 100;
            v[7] = 42;
            if (validate("Broadcast src=42, one in vec", s, v)) pass++; else fail++;
        }

        // Test 9: Scrambled positions
        {
            int[] s = { 5, 12, 37, 91, 44, 63, 18, 29, 76, 50, 83, 11, 67, 25, 99, 40};
            int[] v = {83, 25, 44, 99,  1,  2,  3,  4, 37,  5, 76,  6, 63,  7, 40, 11};
            if (validate("Scrambled positions", s, v)) pass++; else fail++;
        }

        // Test 10: Random
        {
            Random rnd = new Random(42);
            int[] s = rnd.ints(LANES, 0, 100).toArray();
            int[] v = rnd.ints(LANES, 0, 100).toArray();
            if (validate("Random (seed=42)", s, v)) pass++; else fail++;
        }

        System.out.printf("%n  Results: %d PASSED, %d FAILED%n", pass, fail);
        if (fail > 0) {
            System.err.println("\n*** VALIDATION FAILED — aborting benchmark ***");
            System.exit(1);
        }

        /* ============================================================ */
        /*  Phase 2: Array-level benchmark (4096 vs 4096)               */
        /* ============================================================ */

        System.out.println("\n=== Phase 2: Array-Level Benchmark (4096 vs 4096) ===\n");

        int ARRAY_ITERS = 1_000;

        // Build two 4096-element arrays with unique values and planted overlaps
        Random rnd = new Random(42);
        int[] arrA = new int[ARRAY_SIZE];
        int[] arrB = new int[ARRAY_SIZE];
        for (int i = 0; i < ARRAY_SIZE; i++) {
            arrA[i] = i * 3 + 1;           // 1, 4, 7, 10, ...
            arrB[i] = i * 3 + 2;           // 2, 5, 8, 11, ... (no overlap by default)
        }
        // Plant known intersections: copy ~256 values from arrA into random arrB positions
        int planted = 256;
        for (int p = 0; p < planted; p++) {
            int aSrc = rnd.nextInt(ARRAY_SIZE);
            int bDst = rnd.nextInt(ARRAY_SIZE);
            arrB[bDst] = arrA[aSrc];
        }

        int[] outScalar = new int[ARRAY_SIZE];
        int[] outVector = new int[ARRAY_SIZE];

        System.out.printf("Array size     : %,d elements each%n", ARRAY_SIZE);
        System.out.printf("Planted overlaps: ~%d%n", planted);
        System.out.printf("Iterations     : %,d%n%n", ARRAY_ITERS);

        int[] outIntrinsic = new int[ARRAY_SIZE];

        // Validate: array-level results must match
        int arrayCntS = intersectArrayScalar(arrA, arrB, outScalar);
        int arrayCntV = intersectArrayVector(arrA, arrB, outVector);
        int arrayCntI = intersectArrayIntrinsic(arrA, arrB, outIntrinsic);

        boolean arrayOk = (arrayCntS == arrayCntV) &&
            Arrays.equals(outScalar, 0, arrayCntS, outVector, 0, arrayCntV) &&
            (arrayCntS == arrayCntI) &&
            Arrays.equals(outScalar, 0, arrayCntS, outIntrinsic, 0, arrayCntI);

        System.out.printf("  Array validation:  scalar=%d  rotate=%d  intrinsic=%d  %s%n%n",
                          arrayCntS, arrayCntV, arrayCntI, arrayOk ? "PASS" : "**FAIL**");

        if (!arrayOk) {
            System.err.println("*** ARRAY VALIDATION FAILED ***");
            System.err.printf("  Counts: scalar=%d rotate=%d intrinsic=%d%n",
                              arrayCntS, arrayCntV, arrayCntI);
            System.exit(1);
        }

        // Warmup
        for (int w = 0; w < 10; w++) {
            intersectArrayScalar(arrA, arrB, outScalar);
            intersectArrayVector(arrA, arrB, outVector);
            intersectArrayIntrinsic(arrA, arrB, outIntrinsic);
        }

        // Benchmark: intersectArrayScalar
        long ta0 = System.nanoTime();
        int finalCntS = 0;
        for (int i = 0; i < ARRAY_ITERS; i++) {
            finalCntS = intersectArrayScalar(arrA, arrB, outScalar);
        }
        long ta1 = System.nanoTime();

        // Benchmark: intersectArrayVector (rotate-compare)
        long ta2 = System.nanoTime();
        int finalCntV = 0;
        for (int i = 0; i < ARRAY_ITERS; i++) {
            finalCntV = intersectArrayVector(arrA, arrB, outVector);
        }
        long ta3 = System.nanoTime();

        // Benchmark: intersectArrayIntrinsic (Vector.intersect)
        long ta4 = System.nanoTime();
        int finalCntI = 0;
        for (int i = 0; i < ARRAY_ITERS; i++) {
            finalCntI = intersectArrayIntrinsic(arrA, arrB, outIntrinsic);
        }
        long ta5 = System.nanoTime();

        double usScalarArr    = (double)(ta1 - ta0) / ARRAY_ITERS / 1000.0;
        double usRotateArr    = (double)(ta3 - ta2) / ARRAY_ITERS / 1000.0;
        double usIntrinsicArr = (double)(ta5 - ta4) / ARRAY_ITERS / 1000.0;
        double leafCallsPerIter = (double)NUM_BLOCKS * NUM_BLOCKS;

        System.out.printf("%-44s  %10s  %8s%n", "Method", "us/call", "Count");
        System.out.println("------------------------------------------------------------------");
        System.out.printf("%-44s  %8.1f    %4d%n",
                          "intersectArrayScalar     (4096 vs 4096)", usScalarArr, finalCntS);
        System.out.printf("%-44s  %8.1f    %4d%n",
                          "intersectArrayVector     (4096 vs 4096)", usRotateArr, finalCntV);
        System.out.printf("%-44s  %8.1f    %4d%n",
                          "intersectArrayIntrinsic  (4096 vs 4096)", usIntrinsicArr, finalCntI);

        System.out.printf("%nSpeedup (scalar  vs rotate)   : %.1fx%n", usScalarArr / usRotateArr);
        System.out.printf("Speedup (scalar  vs intrinsic): %.1fx%n", usScalarArr / usIntrinsicArr);
        System.out.printf("Speedup (rotate  vs intrinsic): %.1fx%n", usRotateArr / usIntrinsicArr);
        System.out.printf("%nLeaf intersect calls per array intersect: %,.0f  (%d × %d blocks)%n",
                          leafCallsPerIter, NUM_BLOCKS, NUM_BLOCKS);
        System.out.printf("Amortised per leaf call:  scalar=%.0f ns  rotate=%.0f ns  intrinsic=%.0f ns%n",
                          usScalarArr * 1000.0 / leafCallsPerIter,
                          usRotateArr * 1000.0 / leafCallsPerIter,
                          usIntrinsicArr * 1000.0 / leafCallsPerIter);
    }
}

