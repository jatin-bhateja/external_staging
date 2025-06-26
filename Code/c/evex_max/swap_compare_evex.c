
#include "math.h"
#include "stdio.h"
#include "immintrin.h"

typedef __m512 float16;

void print_vec(const char * vec_name, float16 vec) {
  printf("%s => ",vec_name);
  for(int i = 0 ; i < 16 ; i++)
    printf("%lf " , vec[i]);
  printf("\n\n"); 
}

#if defined(VER1)
int swap_vex(float16 a , float16 b) {
  float16 max;
  int k;
  print_vec("a" , a);
  print_vec("b" , b);

  // AT&T syntax assembly"
  asm volatile (
    "vmovaps  %1 , %%zmm1   \n\t"                     // a
    "vmovaps  %2 , %%zmm2   \n\t"                     // b
#ifdef _IACA
    "movl $111, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
    "vpmovd2m %%zmm2, %%k1                 \n\t"    // k1 = MSB of each Doubleword (interger nomenclature ??) , also not in foundation set.. 
    "vmovaps  %%zmm1 , %%zmm3                  \n\t"  // zmm3 (atmp) = a
    "vmovaps  %%zmm2 , %%zmm3  {{%%k1}}        \n\t"  // zmm3 (atmp) = k1 ? b
    "vmovaps  %%zmm2 , %%zmm4                  \n\t"  // zmm4 (btmp) = b
    "vmovaps  %%zmm1 , %%zmm4  {{%%k1}}        \n\t"  // zmm4 (btmp) = k1 ? a
    "vmaxps   %%zmm4 , %%zmm3 , %%zmm5         \n\t"  // zmm5 = Max(atmp,btmp)
    "vcmpps $3, %%zmm3, %%zmm3 , %%k1          \n\t"  // k1 = isNaN(atmp)
    "vmovaps %%zmm3 , %%zmm5   {{%%k1}}         \n\t"  // zmm5 (max) = k1 ? a
#ifdef _IACA
    "movl $222, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
    "vmovaps  %%zmm5 , %0  \n\t"
    : "=v"(max)
    : "v"(a) , "v"(b) 
    : "%ebx", "%zmm0", "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%k1"
  );
  print_vec("max(a,b) = " , max);
  return a[1];
}
#else
int swap_vex(float16 a , float16 b) {
  float16 max;
  int k;
  print_vec("a" , a);
  print_vec("b" , b);

  // AT&T syntax assembly"
  asm volatile (
    "vmovaps  %1 , %%zmm1   \n\t"                     // a
    "vmovaps  %2 , %%zmm2   \n\t"                     // b
#ifdef _IACA
    "movl $111, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
    "vpmovd2m %%zmm2, %%k1                       \n\t"    // k1 = MSB of each Doubleword (interger nomenclature ??) , also not in foundation set.. 
    "vblendmps %%zmm2 , %%zmm1 , %%zmm3 {{%%k1}}  \n\t"   // zmm3 (atmp) = k1 ? b : a
    "vblendmps %%zmm1 , %%zmm2 , %%zmm4 {{%%k1}}  \n\t"   // zmm3 (btmp) = k1 ? a : b
    "vmaxps   %%zmm4 , %%zmm3 , %%zmm5           \n\t"    // zmm5 = Max(atmp,btmp)
    "vcmpps $3, %%zmm3, %%zmm3 , %%k1            \n\t"    // k1 = isNaN(atmp)
    "vmovaps %%zmm3 , %%zmm5   {{%%k1}}         \n\t"     // zmm5 (max) = k1 ? a
#ifdef _IACA
    "movl $222, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
    "vmovaps  %%zmm5 , %0  \n\t"
    : "=v"(max)
    : "v"(a) , "v"(b) 
    : "%ebx", "%zmm0", "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%k1"
  );
  print_vec("max(a,b) = " , max);
  return a[1];
}
#endif

int main() {
  float * mem1 = _mm_malloc(sizeof(float)*16,64);
  float * mem2 = _mm_malloc(sizeof(float)*16,64);
  for(int i = 0 ; i < 16; i++)
    mem1[i] = 1.0f;
  for(int i = 0 ; i < 16; i++)
    mem2[i] = 2.0f;
  mem1[5] = NAN; 
  mem1[0] = 0.0f;
  mem2[0] = -0.0f;

  float16 arg1 =  _mm512_load_ps(mem1);
  float16 arg2 =  _mm512_load_ps(mem2);
  return swap_vex(arg1, arg2);
}


