
#include "immintrin.h"
#include "stdio.h"
#include "omp.h"

#define VL 16
//   Reduction min PS
//   Param0 : zmm0  
// 
//   H256 (zmm2)  = VPERM  MASK=[15-8] , zmm0
//   kmovw  0x11111111 , k1
//   VminPS zmm1, zmm2 ,zmm1 {k1} 
//   H128 (zmm2)  = VPERM MASK[7-4] , zmm1
//   kmovw  0x1111    , k1 
//   VminPS zmm1, zmm2 ,zmm1 {k1} 
//   H64  (zmm2)  = VPERM MASK[3-2], zmm1
//   kmovw  0x11    , k1 
//   VminPS zmm1, zmm2 ,zmm1 {k1} 
//   H32  (zmm2) = VPERM MASK[1] , zmm1
//   kmovw 0x1 , k1
//   VminPS zmm1, zmm2 ,zmm1 {k1} 
#ifdef AVX512
#if 0
__attribute__((noinline))
float vminps512 (__m512 arg) {
  float res = arg[0];
//#pragma omp simd reduction(min:res) 
  for (int i = 1 ; i < 16;  i++)
    res = min(res,arg[i]);
  return res; 
}
#endif


__attribute__((noinline))
float vminps512 (__m512 arg) {
  float res;
  asm volatile (
    "vextractf64x4 $0x1,  %1 ,     %%ymm1      \n\t"
    "vminps        %1,  %%zmm1 , %%zmm2      \n\t"
    "vpermpd      $78,  %%ymm2 , %%ymm1      \n\t"
    "vminps        %%ymm1,  %%ymm2 , %%ymm2  \n\t"
    "vpermilps     $0x4E,  %%ymm2 , %%ymm1     \n\t"
    "vminps        %%ymm1,  %%ymm2 , %%ymm2  \n\t"
    "vpermilps    $0x1,  %%ymm2 , %%ymm1       \n\t"
    "vminps        %%ymm1,  %%ymm2 , %%ymm2  \n\t"
    "vmovss       %%xmm2,  %0                \n\t"
   : "=m"(res)
   : "v"(arg)
   : "%zmm1" , "%zmm2" , "%ymm1" ,"%ymm2" , "%xmm1" , "%xmm2" 
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
float vminps256(__m256 arg) {
  __m256 H128_arg = _mm256_permute2f128_ps(arg, arg, 0x1);
  __m256 R1 = _mm256_min_ps(arg, H128_arg);
  __m256 H64_R1 = _mm256_shuffle_ps(R1, R1, 0xE);
  __m256 R2 = _mm256_min_ps(R1, H64_R1);
  __m256 H32_R2 = _mm256_shuffle_ps(R2, R2, 0x1);
  __m256 R3 = _mm256_min_ps(R2, H32_R2);
  return R3[0];
}

__attribute__((noinline))
float vminps128(__m128 arg) {
  __m128 H64_R1 = _mm_shuffle_ps(arg, arg, 0xE);
  __m128 R2 = _mm_min_ps(arg, H64_R1);
  __m128 H32_R2 = _mm_shuffle_ps(R2, R2, 0x1);
  __m128 R3 = _mm_min_ps(R2, H32_R2);
  return R3[0];
}

__attribute__((noinline))
float vminps64(__m128 arg) {
  __m128 H32_R2 = _mm_shuffle_ps(arg, arg, 0x1);
  __m128 R3 = _mm_min_ps(arg, H32_R2);
  return R3[0];
}

template<typename VType> 
void print_vec(VType v, int L) {
  printf("\n");
  for (int i = 0 ; i < L ; i++)
    printf("%f ",v[i]);
}

int main() {
  float * mem1 = (float*)_mm_malloc(sizeof(float)*VL,64);
  for(int i = 0 ; i < VL; i++)
    mem1[i] = i + 1.1f;
  mem1[7] = -3.5f;
  mem1[3] = -2.5f;

#ifdef AVX512
  __m512 arg =  _mm512_load_ps(mem1);
  print_vec<__m512>(arg,16);
  float res512  =  vminps512(arg);
  printf("\nRes512 = %f\n", res512);
#endif

  __m256 arg1 =  _mm256_load_ps(mem1);
  print_vec<__m256>(arg1,8);
  float res256  =  vminps256(arg1);
  printf("\nRes256 = %f\n", res256);

  __m128 arg2 =  _mm_load_ps(mem1);
  print_vec<__m128>(arg2,4);
  float res128  =  vminps128(arg2);
  printf("\nRes128 = %f\n", res128);

  print_vec<__m128>(arg2,2);
  float res64  =  vminps64(arg2);
  printf("\nRes64 = %f\n", res64);

  return 0;
}


