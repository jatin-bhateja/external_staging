
#include "stdio.h"
#include "immintrin.h"

//typedef float __attribute__((ext_vector_type(8))) double8;
typedef __m512 double8;

void print_vec(const char * vec_name, double8 vec) {
  printf("%s => ",vec_name);
  for(int i = 0 ; i < 8 ; i++)
    printf("%lf " , vec[i]);
  printf("\n\n"); 
}

#if defined(VER1)
int swap_vex(double8 a , double8 b) {
  double8 max;
  print_vec("a" , a);
  print_vec("b" , b);
  asm volatile (
    "vmovaps  %1 , %%zmm1   \n\t" // A
    "vmovaps  %2 , %%zmm2   \n\t" // B
#ifdef _IACA
    "movl $111, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
//      "vxorpd  %%zmm0 , %%zmm0 , %%zmm0          \n\t"  // zmm0 = 0
//      "vcmppd $1, %%zmm0, %%zmm2 , %%k1          \n\t"  // k1 = b < 0
//      "vmovapd  %%zmm1 , %%zmm3                  \n\t"  // zmm3 (atmp) = a
//      "vmovapd  %%zmm2 , %%zmm3  {{%%k1}}        \n\t"  // zmm3 (atmp) = k1 ? b
//      "vmovapd  %%zmm2 , %%zmm4                  \n\t"  // zmm4 (btmp) = b
//      "vmovapd  %%zmm1 , %%zmm4  {{%%k1}}        \n\t"  // zmm4 (btmp) = k1 ? a
      "vmaxps   %%zmm1 , %%zmm2 , %%zmm5         \n\t"  // zmm5 (max)  = MAXPD(atmp, btmp)
//      "vcmppd $3, %%zmm3, %%zmm3 , %%k1          \n\t"  // k1 = isNaN(atmp)
      //"vmovapd %%zmm3 , %%zmm5   {{%%k1}}        \n\t"  // zmm5 (max) = k1 ? a
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
  return a[1] + b[1];
}

#else
int swap_vex(float a , float b) {
  float tmp = 0.0f;
  printf("\na = %f , b = %f \n" , a , b);
  asm volatile (
#ifdef _IACA
    "movl $111, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
      "vxorps  %%zmm0 , %%zmm0 , %%zmm0 \n\t"
      "vcmpps $1 , %%zmm0  , %2 , %%k1   \n\t"
      "vmovaps  %1 , %0  {{%%k1}}    \n\t" 
      "vmovaps  %2 , %1  {{%%k1}}    \n\t"
      "vmovaps  %0 , %2  {{%%k1}}    \n\t"
#ifdef _IACA
    "movl $222, %%ebx        \n\t"
    ".byte 0x64, 0x67, 0x90  \n\t"
#endif
    : "+v"(tmp), "+v"(a) , "+v"(b) 
    : 
    : "%k1" , "%zmm0"
  );
  return printf("\na = %f , b = %f \n" , a , b);
}
#endif

int main() {
  //double8 arg1 = {1.1,10.1,4.1,6.1,-5.2,5.2,12.2,23.2};
  //double8 arg2 = {2.1,-1.1,5.1,2.1,-2.2,2.2,-12.2,22.2};
  double8 arg1 = {1.1,10.1,4.1,6.1,5.2,5.2,12.2,23.2};
  double8 arg2 = {2.1,1.1,5.1,2.1,2.2,2.2,-12.2,22.2};
  return swap_vex(arg1, arg2);
}


