
#include "stdio.h"
#include "math.h"

int val [8] = {0, 0, 0, 0, 0, 0, 0, 0};
float val1 [] = {NAN, 1.0f , NAN, 2.0f , 3.0f, 4.0f , 5.0f, 6.0f};
float val2 [] = {NAN, 2.0f , 7.0f, 3.0f , 1.0f, 7.0f , 5.0f, 6.0f};

int main() {
   asm volatile (
      "vmovdqu  %1, %%ymm0 \n\t"
      "vmovdqu  %2, %%ymm1 \n\t"
      "vcmpps   $0x1E, %%ymm1, %%ymm0, %%ymm2 \n\t"
      "vmovdqu  %%ymm2, %0  \n\t"
     : "=m"(*val)
     : "m"(val1), "m"(val2)
     : "%ymm0" , "%ymm1" , "%ymm2"
   );
   for (int i = 0; i < 8; i++) {
      printf("a = %f, b = %f , cmp =  %d\n", val1[i], val2[i], val[i]);
   }
   return 0;
}

