#include "stdio.h"

/*int main() {
  long m1 = 43690L;
  int res = 0L;
  asm volatile(
    "kmovw %1 , %%k1 \n\t"
    "kshiftrw  $14, %%k1, %%k1 \n\t"
    "kmovd %%k1 , %0 \n\t"
   : "=r"(res)
   : "r"(m1)
   : "%k1"
  );
  return printf("RES = %d\n", res);
}*/

int main() {
  int vec [] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  int res [16] = {0};
  long m1 = 43690L;
  asm volatile(
    "vmovdqu64 %2 , %%zmm1 \n\t"
    "kmovq %1 , %%k1 \n\t"
    "vpcompressd %%zmm1 , %%zmm2 {{%%k1}} \n\t"
    "vmovdqu64 %%zmm1 , %0 \n\t"
   : "=m"(res)
   : "r"(m1), "m"(*vec)
   : "%k1"
  );
  printf("Orig Vector:\n");
  for(int i=0; i < 16 ; i++) {
     printf("%d ", vec[i]);
  }
  printf("Mask : %ld\n", m1);
  printf("Res Vector:\n");
  for(int i=0; i < 16 ; i++) {
     printf("%d ", res[i]);
  }
  return printf("RES = %d\n", res);
}
