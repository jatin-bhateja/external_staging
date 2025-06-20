
#include "stdio.h"
#include "math.h"

void f2l_vec(long* out, float* inp){
  asm volatile(
      "vmovdqu     %1     , %%xmm1 \n\t"
      "vcvttps2qq  %%xmm1 , %%ymm2 \n\t"
      "vmovdqu     %%ymm2 , %0     \n\t"
    : "=m"(*out)
    : "m"(*inp)
    : "%ymm1", "%xmm2"
  );
}

int main () {
  float in[4] = {NAN, INFINITY, 5.4, -NAN} ;
  long out[4];
  f2l_vec(out, in);
  for(int i = 0 ; i < 4; i++ ) {
     printf("in[%d] = %f\n", i, in[i]);
     printf("out[%d] = %ld\n", i, out[i]);
  }
  return 0;
}
