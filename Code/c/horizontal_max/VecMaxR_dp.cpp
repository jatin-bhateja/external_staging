
#include "immintrin.h"
#include "stdio.h"
#include "omp.h"

#define VL 8
//   Reduction max pd
//   Param0 : zmm0  
// 
//   H256 (zmm2)  = VPERM  MASK=[15-8] , zmm0
//   kmovw  0x11111111 , k1
//   Vmaxpd zmm1, zmm2 ,zmm1 {k1} 
//   H128 (zmm2)  = VPERM MASK[7-4] , zmm1
//   kmovw  0x1111    , k1 
//   Vmaxpd zmm1, zmm2 ,zmm1 {k1} 
//   H64  (zmm2)  = VPERM MASK[3-2], zmm1
//   kmovw  0x11    , k1 
//   Vmaxpd zmm1, zmm2 ,zmm1 {k1} 
//   H32  (zmm2) = VPERM MASK[1] , zmm1
//   kmovw 0x1 , k1
//   Vmaxpd zmm1, zmm2 ,zmm1 {k1} 
#ifdef AVX512
#if 0
__attribute__((noinline))
double vmaxpd512 (__m512d arg) {
  double res = arg[0];
//#pragma omp simd reduction(max:res) 
  for (int i = 1 ; i < 16;  i++)
    res = max(res,arg[i]);
  return res; 
}
#endif

__attribute__((noinline))
double vmaxpd512 (__m512d arg) {
  double res;
  asm volatile (
    "vextractf64x4 $0x1,  %1 ,    %%ymm1      \n\t"
    "vmaxpd         %1,  %%zmm1 , %%zmm2      \n\t"
    "vextractf64x2 $0x1,  %%ymm2 , %%xmm1     \n\t"
    "vmaxpd        %%xmm1,  %%xmm2 , %%xmm2   \n\t"
    "vpermilpd     $0x1,  %%xmm2 , %%xmm1     \n\t"
    "vmaxsd       %%xmm1,  %%xmm2 , %%xmm2    \n\t"
    "vmovsd       %%xmm2,  %0                 \n\t"
   : "=m"(res)
   : "v"(arg)
   : "%zmm1" , "%zmm2" , "%ymm1" ,"%ymm2" , "%xmm1" ,"%xmm2" 
  );
  return res; 
}
#endif

/*
   8 -> 4 M 4 --|
     -- 2 M 2 <_|
     |_>1 M 1 ->  Res
*/
__attribute__((noinline))
double vmaxpd256(__m256d arg) {
  __m256d H128_arg = _mm256_permute2f128_pd(arg, arg, 0x1);
  __m256d R1 = _mm256_max_pd(arg, H128_arg);
  __m256d H64_R1 = _mm256_shuffle_pd(R1, R1, 0x1);
  __m256d R2 = _mm256_max_pd(R1, H64_R1);
  return R2[0];
}

__attribute__((noinline))
double vmaxpd128(__m128d arg) {
  __m128d H64_R1 = _mm_shuffle_pd(arg, arg, 0x1);
  __m128d R2 = _mm_max_pd(arg, H64_R1);
  return R2[0];
}

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

#ifdef AVX512
  __m512d arg =  _mm512_load_pd(mem1);
  print_vec<__m512d>(arg,8);
  double res512  =  vmaxpd512(arg);
  printf("\nRes512 = %f\n", res512);
#endif

  __m256d arg1 =  _mm256_load_pd(mem1);
  print_vec<__m256d>(arg1,4);
  double res256  =  vmaxpd256(arg1);
  printf("\nRes256 = %f\n", res256);

  __m128d arg2 =  _mm_load_pd(mem1);
  print_vec<__m128d>(arg2,2);
  double res128  =  vmaxpd128(arg2);
  printf("\nRes128 = %f\n", res128);

  return 0;
}


