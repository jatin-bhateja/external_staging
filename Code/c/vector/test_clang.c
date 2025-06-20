
#include "stdio.h"
#include "stdalign.h"

typedef double __attribute__((ext_vector_type(8))) double_a8;

double_a8 vectorAdd(short mask,double_a8 a, double_a8 b) {
   double_a8 res;
  __asm__ volatile (
    "kmovw %1 , %%k1                        \n\t"  
    "vmovapd %2  ,  %%zmm1                  \n\t"
    "vaddpd  %3  , %%zmm1  , %%zmm0 \n\t"
    "vmovapd %%zmm0 ,  %0          \n\t"
    : "=v"(res)
    : "k"(mask) , "v"(a) , "v"(b)
    : "%zmm0" , "%zmm1" , "%k1"
  );
  return res;
}


int main() {
  double_a8 res = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
  double_a8 a = {1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8};
  double_a8 b = {1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8};

  short mask = 0;
  
  res = vectorAdd(mask, a, b);

  for(int i=0; i<8; i++)
    printf("res[%d] = %lf\n", i, res[i]);

  return 0;
} 
