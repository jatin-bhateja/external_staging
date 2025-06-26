
#include "immintrin.h"
#include "stdio.h"
#include "omp.h"
#include "iacaMarks.h"

#define VL 8
//   Reduction min pd
//   Param0 : zmm0  
// 
//   H256 (zmm2)  = VPERM  MASK=[15-8] , zmm0
//   kmovw  0x11111111 , k1
//   Vminpd zmm1, zmm2 ,zmm1 {k1} 
//   H128 (zmm2)  = VPERM MASK[7-4] , zmm1
//   kmovw  0x1111    , k1 
//   Vminpd zmm1, zmm2 ,zmm1 {k1} 
//   H64  (zmm2)  = VPERM MASK[3-2], zmm1
//   kmovw  0x11    , k1 
//   Vminpd zmm1, zmm2 ,zmm1 {k1} 
//   H32  (zmm2) = VPERM MASK[1] , zmm1
//   kmovw 0x1 , k1
//   Vminpd zmm1, zmm2 ,zmm1 {k1} 
#if VER1
__attribute__((noinline))
double vminpd512 (__m512d arg) {
  double res = arg[0];
//#pragma omp simd reduction(min:res) 
  IACA_START;
  for (int i = 1 ; i < 8;  i++)
     if (res > arg[i])
        res = arg[i];
  IACA_END;
  return res; 
}
#else
__attribute__((noinline))
double vminpd512 (__m512d arg) {
  double res;
  IACA_START;
  asm volatile (
    "vextractf64x4 $0x1,  %1 ,    %%ymm1      \n\t"
    "vminpd         %1,  %%zmm1 , %%zmm2      \n\t"
    "vextractf64x2 $0x1,  %%ymm2 , %%xmm1     \n\t"
    "vminpd        %%xmm1,  %%xmm2 , %%xmm2   \n\t"
    "vpermilpd     $0x1,  %%xmm2 , %%xmm1     \n\t"
    "vminsd       %%xmm1,  %%xmm2 , %%xmm2    \n\t"
    "vmovsd       %%xmm2,  %0                 \n\t"
   : "=m"(res)
   : "v"(arg)
   : "%zmm1" , "%zmm2" , "%ymm1" ,"%ymm2" , "%xmm1" ,"%xmm2" 
  );
  IACA_END;
  return res; 
}
#endif

template<typename VType> 
void print_vec(VType v, int L) {
  printf("\n");
  for (int i = 0 ; i < L ; i++)
    printf("%lf ",v[i]);
}

int main() {
  double * mem1 = (double*)_mm_malloc(sizeof(double)*VL,64);
  for(int i = 0 ; i < VL; i++)
    mem1[i] = i + 1.1;
  mem1[7] = -3.5;
  mem1[3] = -2.5;

  __m512d arg =  _mm512_load_pd(mem1);
  print_vec<__m512d>(arg,8);
  double res512  =  vminpd512(arg);
  printf("\nRes512 = %f\n", res512);
  return 0;
}


