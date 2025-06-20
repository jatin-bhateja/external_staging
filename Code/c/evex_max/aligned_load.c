

#include "stdio.h"
#include "immintrin.h"

int main() {
  float elem;
  float * arr = _mm_malloc(sizeof(float)*4,16);
  arr[0] = 1.1f;
  arr[1] = 2.1f;
  arr[2] = 3.1f;
  arr[3] = 4.1f;
 __m128 val = _mm_load_ps (arr);
  asm volatile (
     "vmovaps  %1, %%xmm1      \n\t"
     "vextractps $3 , %%xmm1 , %0 \n\t"
   : "=r"(elem)
   : "v"(val)
   : "%zmm1"
  );
  printf("%f..\n", elem);
  return (int)elem;
}
