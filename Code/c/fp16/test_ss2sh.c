#include <stdio.h>
#include <stdlib.h>

// 0x1fff
int micro1_roundtoEven(float in) {
    int out = 0;
    asm volatile(
        "vcvtps2ph $0, %1, %%xmm1 \n\t"
        "movd %%xmm1, %0          \n\t"
       : "=r"(out)
       : "x"(in)
       : "%xmm1"
    );
    return out;
}

// 0x5fff
int micro2_roundToInf(float in) {
    int out = 0;
    asm volatile(
        "vcvtps2ph $2, %1, %%xmm1 \n\t"
        "movd %%xmm1, %0          \n\t"
       : "=r"(out)
       : "x"(in)
       : "%xmm1"
    );
    return out;
}

int mxcsr_round2even = 0x1fff;
// 0x1fff
int micro3_roundtoEven(float in) {
    int out = 0;
    asm volatile(
        "ldmxcsr %2                   \n\t"
        "vpxor %%xmm2, %%xmm2, %%xmm2 \n\t"
        "vcvtss2sh %1, %%xmm2, %%xmm1 \n\t"
        "movd %%xmm1, %0              \n\t"
       : "=r"(out)
       : "x"(in), "m"(mxcsr_round2even)
       : "%xmm1", "%xmm2"
    );
    return out;
}

int mxcsr_roundToInf = 0x5fff;
// 0x5fff
int micro4_roundToInf(float in) {
    int out = 0;
    asm volatile(
        "ldmxcsr %2                   \n\t"
        "vpxor %%xmm2, %%xmm2, %%xmm2 \n\t"
        "vcvtss2sh %1, %%xmm2, %%xmm1 \n\t"
        "movd %%xmm1, %0              \n\t"
       : "=r"(out)
       : "x"(in), "m"(mxcsr_roundToInf)
       : "%xmm1", "%xmm2"
    );
    return out;
}

int main() {
  float in = 65415.5f;
  printf("in   = %f \n", in);
  printf("out1 = %d \n", micro1_roundtoEven(in));
  printf("out2 = %d \n", micro2_roundToInf(in));
  printf("out3 = %d \n", micro3_roundtoEven(in));
  printf("out4 = %d \n", micro4_roundToInf(in));
  return 0;
}

