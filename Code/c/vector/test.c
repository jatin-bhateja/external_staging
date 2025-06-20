
#include "stdio.h"
#include "stdalign.h"

alignas(64) double res[] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
alignas(64) double a[] = {1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8};
alignas(64) double b[] = {1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8};

__attribute__((noinline))
void vectorAdd(short mask) {
  __asm__ volatile (
    "kmovw   %1  , %%k1                     \n\t"
    "vmovapd %2  , %%zmm1                   \n\t"
    "vaddpd  %3  , %%zmm1  , %%zmm0{{%%k1}} \n\t"
    "vmovapd %%zmm0 , %0{{%%k1}}            \n\t"
    : "=m"(res)
    : "k"(mask) , "m"(a) , "m"(b)
    : "%zmm0" , "%zmm1" , "%k1"
  );
}


int main() {
  short mask = -1;
  
  vectorAdd(mask);

  for(int i=0; i<8; i++)
    printf("res[%d] = %lf", i, res[i]);

  return 0;
} 
