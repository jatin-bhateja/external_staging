
#include <immintrin.h>
#include <math.h>

extern "C"
void __svml_expf16_ha();

extern "C"
__m512 _my512_expm1_ps(__m512 vec) {
    __m512 res;
    asm volatile (
      "vmovdqu64 %1, %%zmm0  \n\t"
      "call __svml_expf16_ha \n\t"
      "vmovdqu64 %%zmm0, %0  \n\t"
    : "=x"(res)
    : "x"(vec)
    : "%zmm0"
    );
    return res;
}

extern "C"
void compute_softmax(float* pred, float* input, int n) {
    const int VS = 16;
    int i = 0;

    // ----------------------------------------
    // PASS 1: Find max
    // ----------------------------------------
    float maxv = -INFINITY;

    for (; i + VS <= n; i += VS) {
        __m512 v = _mm512_loadu_ps(input + i);
        float m = _mm512_reduce_max_ps(v);
        if (m > maxv) maxv = m;
    }

    // tail
    if (i < n) {
        __mmask16 mask = (1 << (n - i)) - 1;
        __m512 v = _mm512_maskz_loadu_ps(mask, input + i);
        float m = _mm512_mask_reduce_max_ps(mask, v);
        if (m > maxv) maxv = m;
    }

    // ----------------------------------------
    // PASS 2: Compute exp(x - max) using expm1
    // pred[i] = expm1(x - max) + 1
    // ----------------------------------------
    __m512 vmax = _mm512_set1_ps(maxv);

    i = 0;
    for (; i + VS <= n; i += VS) {
        __m512 x = _mm512_loadu_ps(input + i);
        x = _mm512_sub_ps(x, vmax);
        x = _my512_expm1_ps(x);     // exp(x) - 1
        x = _mm512_add_ps(x, _mm512_set1_ps(1.0f)); // exp(x)
        _mm512_storeu_ps(pred + i, x);
    }

    if (i < n) {
        __mmask16 mask = (1 << (n - i)) - 1;
        __m512 x = _mm512_maskz_loadu_ps(mask, input + i);
        x = _mm512_sub_ps(x, vmax);
        x = _my512_expm1_ps(x);
        x = _mm512_add_ps(x, _mm512_set1_ps(1.0f));
        _mm512_mask_storeu_ps(pred + i, mask, x);
    }

    // ----------------------------------------
    // PASS 3: Sum all exp(x - max)
    // ----------------------------------------
    float sum = 0.0f;
    i = 0;

    for (; i + VS <= n; i += VS) {
        __m512 v = _mm512_loadu_ps(pred + i);
        sum += _mm512_reduce_add_ps(v);
    }

    if (i < n) {
        __mmask16 mask = (1 << (n - i)) - 1;
        __m512 v = _mm512_maskz_loadu_ps(mask, pred + i);
        sum += _mm512_mask_reduce_add_ps(mask, v);
    }

    if (sum == 0.0f) sum = 0x1.0P-149f;   // safety

    __m512 vsum = _mm512_set1_ps(sum);

    // ----------------------------------------
    // PASS 4: Normalize
    // pred[i] = pred[i] / sum
    // ----------------------------------------
    i = 0;
    for (; i + VS <= n; i += VS) {
        __m512 v = _mm512_loadu_ps(pred + i);
        v = _mm512_div_ps(v, vsum);
        _mm512_storeu_ps(pred + i, v);
    }

    if (i < n) {
        __mmask16 mask = (1 << (n - i)) - 1;
        __m512 v = _mm512_maskz_loadu_ps(mask, pred + i);
        v = _mm512_div_ps(v, vsum);
        _mm512_mask_storeu_ps(pred + i, mask, v);
    }
}
