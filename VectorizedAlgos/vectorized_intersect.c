/*
 * vector_intersect.c — Microbenchmark justifying Vector.intersect(Vector) API
 *
 * Proposed API semantics (jdk.incubator.vector):
 *   <E> VectorMask<E> Vector.intersect(Vector<E> vec)
 *
 * Returns a VectorMask<E> where lane i is set if this[i] exists in any
 * lane of 'vec'. The mask can then be used with compress/select operations
 * to extract matching elements.
 *
 * Example:
 *   this = [42,  7, 99, 13, 88,  3, 55, 21, 66, 11, 77, 31,  2, 44, 15, 70]
 *   vec  = [50, 55, 33, 11,  8, 42, 15, 66, 44,  9, 21,  3, 13, 88, 70,  7]
 *   mask = [ T,  T,  F,  T,  T,  T,  T,  T,  T,  T,  F,  F,  F,  T,  T,  T]
 *   compress(this, mask) = [42, 7, 13, 88, 3, 55, 21, 66, 11, 44, 15, 70]  (count=12)
 *
 * Three leaf implementations compared — each takes two 16-element int
 * arrays and returns a uint16_t mask (bit i set ⇔ src[i] found in vec):
 *   1. Scalar             — nested loop
 *   2. Rotate-and-compare — VPERMD + VPCMPEQD (mirrors Vector API pattern)
 *   3. VP2INTERSECTD       — single instruction → mask
 *
 * Array-level intersection calls the leaf routine for every pair of
 * 16-element blocks, ORs the masks per source block, then compresses.
 *
 * Compile (Tiger Lake or -march with vp2intersect):
 *   gcc -O2 -mavx512f -mavx512vl -mavx512vp2intersect -o vector_intersect vector_intersect.c
 *
 * For rotation-only variant on any AVX-512 machine:
 *   gcc -O2 -mavx512f -o vector_intersect vector_intersect.c
 *     (comment out the VP2INTERSECT function and benchmark calls)
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <immintrin.h>

#define LANES           16
#define ARRAY_SIZE      4096
#define ARRAY_BLOCKS    (ARRAY_SIZE / LANES)   /* 256 */
#define ARRAY_ITERS     1000

/* ------------------------------------------------------------------ */
/*  Timing helpers (serialised rdtsc)                                 */
/* ------------------------------------------------------------------ */

static inline uint64_t rdtsc_start(void) {
    uint32_t lo, hi;
    __asm__ __volatile__ (
        "cpuid\n\t"
        "rdtsc"
        : "=a"(lo), "=d"(hi)
        : "a"(0)
        : "rbx", "rcx"
    );
    return ((uint64_t)hi << 32) | lo;
}

static inline uint64_t rdtsc_end(void) {
    uint32_t lo, hi;
    __asm__ __volatile__ (
        "rdtscp"
        : "=a"(lo), "=d"(hi)
        :
        : "rcx"
    );
    __asm__ __volatile__ ("cpuid" : : "a"(0) : "rbx", "rcx", "edx");
    return ((uint64_t)hi << 32) | lo;
}

/* ================================================================== */
/*  Leaf routines — return uint16_t mask                              */
/*                                                                    */
/*  Each takes two aligned 16×int arrays (src, vec) and returns a     */
/*  16-bit mask where bit i is set iff src[i] exists in vec[0..15].   */
/*  This mirrors VectorMask<E> Vector.intersect(Vector<E> vec).       */
/* ================================================================== */

/* ---- Variant 1: Scalar — nested loop ---- */

static inline uint16_t intersect_scalar(const int *src, const int *vec) {
    uint16_t mask = 0;
    for (int i = 0; i < LANES; i++) {
        for (int j = 0; j < LANES; j++) {
            if (src[i] == vec[j]) {
                mask |= (1u << i);
                break;
            }
        }
    }
    return mask;
}

/* ---- Variant 2: Rotate-and-compare (mirrors Vector API pattern) ----
 *
 * This mirrors what a developer can write today using the Vector API:
 *
 *   VectorMask<Integer> mask = species.maskAll(false);
 *   IntVector rotated = vb;
 *   for (int i = 0; i < VLENGTH; i++) {
 *       mask = mask.or(va.compare(EQ, rotated));
 *       rotated = rotated.rearrange(rotateBy1);
 *   }
 *
 * Maps to: 16 VPCMPEQD + 15 VPERMD + 15 KORW = 46 instructions.
 * rearrange() always lowers to cross-lane VPERMD; the Vector API has
 * no way to request cheaper in-lane shuffles.
 */

static inline uint16_t intersect_rotate(const int *src, const int *vec) {
    __m512i vsrc = _mm512_load_si512(src);
    __m512i vvec = _mm512_load_si512(vec);
    __m512i rot  = _mm512_set_epi32(0,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1);

    __mmask16 mask = _mm512_cmpeq_epi32_mask(vsrc, vvec);
    __m512i rotated = vvec;
    for (int i = 1; i < 16; i++) {
        rotated = _mm512_permutexvar_epi32(rot, rotated);
        mask |= _mm512_cmpeq_epi32_mask(vsrc, rotated);
    }
    return mask;
}

/* ---- Variant 3: VP2INTERSECTD ---- */

static inline uint16_t intersect_vp2(const int *src, const int *vec) {
    uint32_t mask;
    __asm__ __volatile__ (
        "vmovdqu32      (%[src]), %%zmm0          \n\t"
        "vmovdqu32      (%[vec]), %%zmm1          \n\t"

        "vp2intersectd  %%zmm1, %%zmm0, %%k2     \n\t"

        "kmovw          %%k2, %[m]                \n\t"

        : [m] "=r" (mask)
        : [src] "r" (src),
          [vec] "r" (vec)
        : "zmm0", "zmm1",
          "k2", "k3",
          "memory"
    );
    return (uint16_t)mask;
}

/* ================================================================== */
/*  Compress helper — apply mask to src, store matched lanes to dst   */
/* ================================================================== */

static inline int compress_store(const int *src, uint16_t mask, int *dst) {
    __asm__ __volatile__ (
        "kmovw          %[m], %%k1                \n\t"
        "vmovdqu32      (%[src]), %%zmm0          \n\t"
        "vpcompressd    %%zmm0, %%zmm1 %{%%k1%}%{z%} \n\t"
        "vmovdqu32      %%zmm1, (%[dst])          \n\t"
        : : [m] "r" ((unsigned)mask), [src] "r" (src), [dst] "r" (dst)
        : "zmm0", "zmm1", "k1", "memory"
    );
    return __builtin_popcount(mask);
}

/* ================================================================== */
/*  Array-level intersection                                          */
/*                                                                    */
/*  For each 16-element block of arrA, call the leaf routine against  */
/*  every block of arrB, OR the returned masks, then compress the     */
/*  matched lanes and advance the output pointer.                     */
/* ================================================================== */

typedef uint16_t (*leaf_fn)(const int *src, const int *vec);

static int array_intersect(const int *arrA, const int *arrB, int *out,
                           leaf_fn leaf) {
    int pos = 0;
    for (int ia = 0; ia < ARRAY_SIZE; ia += LANES) {
        uint16_t acc = 0;
        for (int ib = 0; ib < ARRAY_SIZE; ib += LANES) {
            acc |= leaf(&arrA[ia], &arrB[ib]);
        }
        int n = compress_store(&arrA[ia], acc, &out[pos]);
        pos += n;
    }
    return pos;
}

/* ================================================================== */
/*  Validation helpers                                                */
/* ================================================================== */

static void print_vec(const char *label, const int *v, int n) {
    printf("  %-12s [", label);
    for (int i = 0; i < n; i++)
        printf("%s%d", i ? ", " : "", v[i]);
    printf("]\n");
}

static int arrays_equal(const int *a, const int *b, int n) {
    for (int i = 0; i < n; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}

static int validate_leaf(const char *tag,
                         const int *src, const int *vec,
                         uint16_t ref_mask,
                         leaf_fn fn) {
    uint16_t mask = fn(src, vec);
    if (mask != ref_mask) {
        printf("    **FAIL** %-20s  expected 0x%04x  got 0x%04x\n",
               tag, ref_mask, mask);
        return 0;
    }
    return 1;
}

static int run_test(const char *name, const int *src, const int *vec) {
    uint16_t ref_mask = intersect_scalar(src, vec);
    int ok = 1;

    ok &= validate_leaf("Rotate",             src, vec, ref_mask, intersect_rotate);
    ok &= validate_leaf("VP2INTERSECTD",     src, vec, ref_mask, intersect_vp2);

    printf("  %-40s  mask=0x%04x  count=%2d  %s\n",
           name, ref_mask, __builtin_popcount(ref_mask), ok ? "PASS" : "FAIL");
    return ok;
}

/* ================================================================== */
/*  Driver                                                            */
/* ================================================================== */

int main(void) {
    int __attribute__((aligned(64))) src[LANES];
    int __attribute__((aligned(64))) vec[LANES];
    int pass = 0, fail = 0;

    /* ============================================================== */
    /*  Phase 1: Leaf validation                                      */
    /* ============================================================== */

    printf("=== Phase 1: Leaf Validation ===\n\n");

    /* Test 1: Mixed intersection (the example from the header comment) */
    {
        int s[16] = {42,  7, 99, 13, 88,  3, 55, 21, 66, 11, 77, 31,  2, 44, 15, 70};
        int v[16] = {50, 55, 33, 11,  8, 42, 15, 66, 44,  9, 21,  3, 13, 88, 70,  7};
        memcpy(src, s, sizeof(s));
        memcpy(vec, v, sizeof(v));
        if (run_test("Mixed (12 of 16 match)", src, vec)) pass++; else fail++;
    }

    /* Test 2: No overlap */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i; vec[i] = i + 100; }
        if (run_test("No overlap", src, vec)) pass++; else fail++;
    }

    /* Test 3: Full overlap (identical vectors) */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i * 7 + 3; vec[i] = i * 7 + 3; }
        if (run_test("Full overlap (identical)", src, vec)) pass++; else fail++;
    }

    /* Test 4: Full overlap but reversed order */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i + 1; vec[i] = LANES - i; }
        if (run_test("Full overlap (reversed vec)", src, vec)) pass++; else fail++;
    }

    /* Test 5: Single match at first lane */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i; vec[i] = i + 100; }
        vec[8] = src[0];
        if (run_test("Single match (lane 0)", src, vec)) pass++; else fail++;
    }

    /* Test 6: Single match at last lane */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i; vec[i] = i + 100; }
        vec[3] = src[15];
        if (run_test("Single match (lane 15)", src, vec)) pass++; else fail++;
    }

    /* Test 7: Every other lane matches */
    {
        for (int i = 0; i < LANES; i++) { src[i] = i; vec[i] = (i % 2 == 0) ? i : i + 200; }
        if (run_test("Alternating matches (even lanes)", src, vec)) pass++; else fail++;
    }

    /* Test 8: Same value in all lanes of this, one copy in vec */
    {
        for (int i = 0; i < LANES; i++) src[i] = 42;
        for (int i = 0; i < LANES; i++) vec[i] = i + 100;
        vec[7] = 42;
        if (run_test("Broadcast this=42, one in vec", src, vec)) pass++; else fail++;
    }

    /* Test 9: Scrambled — matches in non-sequential positions */
    {
        int s[16] = { 5, 12, 37, 91, 44, 63, 18, 29, 76, 50, 83, 11, 67, 25, 99, 40};
        int v[16] = {83, 25, 44, 99,  1,  2,  3,  4, 37,  5, 76,  6, 63,  7, 40, 11};
        memcpy(src, s, sizeof(s));
        memcpy(vec, v, sizeof(v));
        if (run_test("Scrambled positions", src, vec)) pass++; else fail++;
    }

    printf("  Leaf validation: %d PASSED, %d FAILED\n", pass, fail);
    if (fail > 0) {
        fprintf(stderr, "\n*** LEAF VALIDATION FAILED — aborting benchmark ***\n");
        return 1;
    }

    /* ============================================================== */
    /*  Phase 2: Array-level benchmark (4096 vs 4096)                 */
    /*                                                                */
    /*  For each 16-element block of arrA, call the leaf routine      */
    /*  against every block of arrB, OR the returned masks, then      */
    /*  compress the matched lanes.                                   */
    /*  Total leaf calls per array intersect: 256 × 256 = 65,536.    */
    /* ============================================================== */

    printf("\n=== Phase 2: Array-Level Benchmark (%d vs %d) ===\n\n", ARRAY_SIZE, ARRAY_SIZE);

    int __attribute__((aligned(64))) arrA[ARRAY_SIZE];
    int __attribute__((aligned(64))) arrB[ARRAY_SIZE];
    int __attribute__((aligned(64))) outS[ARRAY_SIZE];
    int __attribute__((aligned(64))) outR[ARRAY_SIZE];
    int __attribute__((aligned(64))) outV[ARRAY_SIZE];

    srand(42);
    for (int i = 0; i < ARRAY_SIZE; i++) {
        arrA[i] = rand() % 100000;
        arrB[i] = rand() % 100000;
    }
    int planted = 0;
    for (int i = 0; i < ARRAY_SIZE; i += LANES) {
        if ((rand() % 4) == 0) {
            int src_lane = rand() % LANES;
            int dst_blk  = (rand() % ARRAY_BLOCKS) * LANES;
            int dst_lane = rand() % LANES;
            arrB[dst_blk + dst_lane] = arrA[i + src_lane];
            planted++;
        }
    }

    int cnt_as = array_intersect(arrA, arrB, outS, intersect_scalar);
    int cnt_ar = array_intersect(arrA, arrB, outR, intersect_rotate);
    int cnt_av = array_intersect(arrA, arrB, outV, intersect_vp2);

    printf("Array size       : %d elements each\n", ARRAY_SIZE);
    printf("Planted overlaps : ~%d\n", planted);
    printf("Leaf calls/iter  : %d  (%d x %d blocks)\n\n",
           ARRAY_BLOCKS * ARRAY_BLOCKS, ARRAY_BLOCKS, ARRAY_BLOCKS);

    int arr_ok = (cnt_as == cnt_ar) && (cnt_ar == cnt_av)
              && arrays_equal(outS, outR, cnt_as)
              && arrays_equal(outS, outV, cnt_as);
    printf("  Array validation:  scalar=%d  rotate=%d  vp2=%d  %s\n\n",
           cnt_as, cnt_ar, cnt_av, arr_ok ? "PASS" : "**FAIL**");

    if (!arr_ok) {
        fprintf(stderr, "\n*** ARRAY VALIDATION FAILED — aborting Phase 3 ***\n");
        return 1;
    }

    /* warmup */
    for (int w = 0; w < 3; w++) {
        volatile int s2;
        s2 = array_intersect(arrA, arrB, outV, intersect_vp2);
    }

    printf("Iterations   : %d\n\n", ARRAY_ITERS);

    /* ---- Scalar array benchmark ---- */
    uint64_t a_ts0 = rdtsc_start();
    volatile int a_sink_s = 0;
    for (int it = 0; it < ARRAY_ITERS; it++)
        a_sink_s = array_intersect(arrA, arrB, outS, intersect_scalar);
    uint64_t a_ts1 = rdtsc_end();

    /* ---- Rotate-and-compare array benchmark ---- */
    uint64_t a_tr0 = rdtsc_start();
    volatile int a_sink_r = 0;
    for (int it = 0; it < ARRAY_ITERS; it++)
        a_sink_r = array_intersect(arrA, arrB, outR, intersect_rotate);
    uint64_t a_tr1 = rdtsc_end();

    /* ---- VP2INTERSECTD array benchmark ---- */
    uint64_t a_tv0 = rdtsc_start();
    volatile int a_sink_v = 0;
    for (int it = 0; it < ARRAY_ITERS; it++)
        a_sink_v = array_intersect(arrA, arrB, outV, intersect_vp2);
    uint64_t a_tv1 = rdtsc_end();

    double a_cyc_scalar = (double)(a_ts1 - a_ts0) / ARRAY_ITERS;
    double a_cyc_rotate = (double)(a_tr1 - a_tr0) / ARRAY_ITERS;
    double a_cyc_vp2    = (double)(a_tv1 - a_tv0) / ARRAY_ITERS;
    int leaf_calls = ARRAY_BLOCKS * ARRAY_BLOCKS;

    printf("%-40s  %14s  %8s\n", "Method", "Cycles/iter", "Count");
    printf("----------------------------------------------------------------------\n");
    printf("%-40s  %12.0f    %4d\n", "Scalar (nested loop)",           a_cyc_scalar, cnt_as);
    printf("%-40s  %12.0f    %4d\n", "Rotate + COMPRESS (Vector API)",   a_cyc_rotate, cnt_ar);
    printf("%-40s  %12.0f    %4d\n", "VP2INTERSECTD + COMPRESS",      a_cyc_vp2,    cnt_av);

    printf("\nSpeedup vs scalar:\n");
    printf("  Rotate (Vector API):     %5.1fx\n", a_cyc_scalar / a_cyc_rotate);
    printf("  VP2INTERSECTD:           %5.1fx\n", a_cyc_scalar / a_cyc_vp2);

    printf("\nSpeedup VP2INTERSECTD vs rotate: %.1fx\n",
           a_cyc_rotate / a_cyc_vp2);

    printf("\nAmortised per leaf (%d leaf calls):\n", leaf_calls);
    printf("  Scalar:     %.1f cycles/leaf\n", a_cyc_scalar / leaf_calls);
    printf("  Rotate:     %.1f cycles/leaf\n", a_cyc_rotate / leaf_calls);
    printf("  VP2:        %.1f cycles/leaf\n", a_cyc_vp2    / leaf_calls);

    return 0;
}
