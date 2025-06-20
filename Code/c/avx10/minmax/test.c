

#include <stdio.h>
#include <chrono>


//  if (b < 0)
//    swap(a, b);  ->  tmp = b < 0 ? a : b;
//                     a  =  b < 0 ? b : a;
//                     b  = tmp;

float vector_max_avx(float a , float b) {
  float res = 0.0f;
  __asm__ volatile(
     "vpmovw2m   %1, %%k1                    \n\t"
     "vpblendmw  %2 , %1 , %%k1 , %%xmm1     \n\t"
     "vpblendmw  %1 , %2 , %%k1 , %%xmm2     \n\t"
     "vmaxsh     %%xmm2, %%xmm1, %0          \n\t"
     "vcmpsh     %%xmm1, %%xmm2 , %%k2       \n\t"    
     "vmovdquw   %%xmm1, %0 %{%%k2}          \n\t"
    : "=x"(res)
    : "x"(a) , "x"(b) 
    : "%xmm1", "%xmm2", "%k2", "%k1"
  );
  return res;
}

int main() {
   return printf(" res = %f\n", vector_max_avx(10.3, 2.3));
}
