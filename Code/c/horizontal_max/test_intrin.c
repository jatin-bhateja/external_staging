
#include "immintrin.h"
#include "stdio.h"
#include "string.h"

__attribute__((noinline))
double JNI_MinReduction_512(__m512d vec) {
  return _mm512_reduce_min_pd(vec);
}

#define SIZE 8

int main() {
  //double * mem = _mm_malloc(sizeof(double)*8,64);
  double * mem = _mm_malloc(sizeof(double)*SIZE,64);

  // poisoning the 512 bits...
  //memset(mem,sizeof(double)*8,2);

  for(int i = 0; i < SIZE; i++)
    mem[i] = 1.0 + i;

  __m512d arg = _mm512_load_pd(mem);
  double res = JNI_MinReduction_512(arg);

  return printf("Res = %f..\n", res);
}
