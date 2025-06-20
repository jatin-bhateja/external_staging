
#include <stdio.h>
#include <math.h>

// compile command        : clang -mavx10.2-256 -DAVX10 saturating-f2i.
// emulation command line : sde -dmr -itrace-execute-emulate -icount -ptr_raise -- ./a.out
// tags                   : arm parity, optimization over legacy CVTTSS2SI + SPECIAL-HANDLING.

#ifdef AVX10
void micro_f2i_sat_new(float src) {
  int dst = 0;
  asm volatile (
      "vcvttss2sis %1, %0 \n\t"
    : "=r"(dst)
    : "x"(src)
    :
  );
  printf("src = %f , dst = %d\n", src, dst);
}
#endif //AVX10

void micro_f2i_old(float src) {
  int dst = 0;
  asm volatile (
      "cvttss2si %1, %0 \n\t"
    : "=r"(dst)
    : "x"(src)
    :
  );
  printf("src = %f , dst = %d\n", src, dst);
}

int main() {
#ifdef AVX10
  printf("F2I SATURATING NEW\n");
  micro_f2i_sat_new(10.2f);
  micro_f2i_sat_new(INFINITY);
  micro_f2i_sat_new(-INFINITY);
  micro_f2i_sat_new(0x1.fffp+35f);
  micro_f2i_sat_new(0.0f);
  micro_f2i_sat_new(-0.0f);
  micro_f2i_sat_new(NAN);
#endif //AVX10

  printf("\nF2I OLD (WO SPECIAL HANDLING)\n");
  micro_f2i_old(10.2f);
  micro_f2i_old(INFINITY);
  micro_f2i_old(-INFINITY);
  micro_f2i_old(0x1.fffp+35f);
  micro_f2i_old(0.0f);
  micro_f2i_old(-0.0f);
  micro_f2i_old(NAN);
  return 0;
}
