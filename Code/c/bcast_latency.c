#include "stdlib.h"

int case1() {
   int temp = 0;
   int ret =  -1;
   for(int i = 0 ; i < 10000000; i++) {
     asm volatile(
          "vpbroadcastd %1, %%zmm1 \n\t"
          "vpandd %%zmm1, %%zmm1, %%zmm1 \n\t"
          "movd %%xmm1, %0 \n\t"
        : "=r"(temp)
        : "r"(i)
        : "%zmm1"
     );
     ret += temp;
   }
   return ret;
}

int case2() {
   int temp = 0;
   int ret =  -1;
   for(int i = 0 ; i < 10000000; i++) {
     asm volatile(
          "movd %1 , %%xmm1 \n\t"
          "vpbroadcastd %%xmm1, %%zmm1 \n\t"
          "vpandd %%zmm1, %%zmm1, %%zmm1 \n\t"
          "movd %%xmm1, %0 \n\t"
        : "=r"(temp)
        : "r"(i)
        : "%zmm1"
     );
     ret += temp;
   }
   return ret;
}

int main(int argc, char * argv[]) {
  int case_op = atoi(argv[1]);
  return case_op == 1 ? case1() : case2();
}
