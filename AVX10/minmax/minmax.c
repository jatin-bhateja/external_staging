
#include <stdio.h>
#include <math.h>

// compile command        : clang -mavx10.2-256 -DAVX10 minmax.c
// emulation command line : sde -dmr -itrace-execute-emulate -icount -ptr_raise -- ./a.out
// tags                   : arm parity, optimization over legacy VMINSS.

// MAX - TBD
#ifdef AVX10
void micro_min_new(float src1, float src2) {
  float dst = 0.0f;
  // imm8[1:0] = 0  => MIN
  // imm8[3:2] = 01 => SIGNED COMPARISON
  // imm8[4]   = 0  => MIN (non-magnitude variant)
  asm volatile (
      "vminmaxss $0x4, %2, %1, %0 \n\t"
    : "=x"(dst)
    : "x"(src1), "x"(src2)
    :
  );
  printf("src1  = %f , src2  = %f, min = %f\n", src1, src2, dst);
}
#endif //AVX10

void micro_min_old(float src1, float src2) {
  float dst = 0.0f;
  asm volatile (
      "vminss %2, %1, %0 \n\t"
    : "=x"(dst)
    : "x"(src1), "x"(src2)
    :
  );
  printf("src1  = %f , src2  = %f, min = %f\n", src1, src2, dst);
}

int main() {
#ifdef AVX10
  printf("MIN NEW\n");
  micro_min_new(10.0f, 5.0f);
  micro_min_new(0.0f, -0.0f);
  micro_min_new(-0.0f, 0.0f);
  micro_min_new(NAN, 4.0f);
  micro_min_new(NAN, NAN);
  micro_min_new(INFINITY, -INFINITY);
#endif //AVX10

  printf("MIN OLD\n");
  micro_min_old(10.0f, 5.0f);
  micro_min_old(0.0f, -0.0f);
  micro_min_old(-0.0f, 0.0f);
  micro_min_old(NAN, 4.0f);
  micro_min_old(NAN, NAN);
  micro_min_old(INFINITY, -INFINITY);
  return 0;
}
