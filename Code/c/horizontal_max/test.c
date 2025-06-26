
#include "immintrin.h"
#include "stdio.h"

//   Reduction Max PS
//   Param0 : zmm0  
// 
//   H256 (zmm2)  = VPERM  MASK=[15-8] , zmm0
//   kmovw  0x11111111 , k1
//   VMAXPS zmm1, zmm2 ,zmm1 {k1} 
//   H128 (zmm2)  = VPERM MASK[7-4] , zmm1
//   kmovw  0x1111    , k1 
//   VMAXPS zmm1, zmm2 ,zmm1 {k1} 
//   H64  (zmm2)  = VPERM MASK[3-2], zmm1
//   kmovw  0x11    , k1 
//   VMAXPS zmm1, zmm2 ,zmm1 {k1} 
//   H32  (zmm2) = VPERM MASK[1] , zmm1
//   kmovw 0x1 , k1
//   VMAXPS zmm1, zmm2 ,zmm1 {k1} 

void vrmaxps512 (float res, float * a) {


}

int main() {
  float * mem1 = _mm_malloc(sizeof(float)*16,64);
  float * mem2 = _mm_malloc(sizeof(float)*16,64);
  for(int i = 0 ; i < 16; i++)
    mem1[i] = i + 1.1f;
  for(int i = 0 ; i < 16; i++)
    mem2[i] = i%8 + 2.1f;
  mem1[3] = -2.4f;
  mem2[3] = -1.4f;
  mem1[2] = NAN;
  mem2[6] = NAN;
  mem1[0] = 0.0f;
  mem2[0] = -0.0f;

  float16 arg1 =  _mm512_load_ps(mem1);
  float16 arg2 =  _mm512_load_ps(mem2);
  return swap_vex(arg1, arg2);
}


