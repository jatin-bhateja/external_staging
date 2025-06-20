
#include "stdio.h"

void d2i_vec(int* out, double* inp){
  asm volatile(
      "vmovdqu     %1     , %%ymm1 \n\t"
      "vcvttpd2dq  %%ymm1 , %%xmm2 \n\t"
      "vmovdqu     %%xmm2 , %0     \n\t"
    : "=m"(*out)
    : "m"(*inp)
    : "%ymm1", "%xmm2"
  );
}

int main () {
  double in [] = {1.1,2.2,1.7976931348623157E308,6.6};
  int out[4];
  d2i_vec(out, in);
  for(int i = 0 ; i < 4; i++ ) {
     printf("in[%d] = %lf\n", i, in[i]);
     printf("out[%d] = %d\n", i, out[i]);
  }
  return 0;
}
