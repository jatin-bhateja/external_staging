
#include "stdio.h"

void printA(int * arr, int L) {
  printf("arr = {");
  for(int i = 0 ; i < L ; i++) 
    printf(" %d " , arr[i]);
  printf("}\n");
}

__attribute__((noinline))
int * rotateEL_VecY_TypeI(int VL, int N , int* arr) {
   printA(arr, VL);
   VL = VL - 1;
   N = N & VL;
   asm volatile(
       "vmovdqu %0   , %%xmm1   \n\t"
       "vpbroadcastd %1 , %%xmm2  \n\t"
       "vpbroadcastd %2 , %%xmm3  \n\t" 

       "movq $0 , %%rcx           \n\t"
       "vmovd  %%rcx , %%xmm4     \n\t"
       "vpbroadcastd %%xmm4 , %%xmm5 \n\t" 
       "movq $1 , %%rcx           \n\t"
       "vmovd  %%rcx , %%xmm4     \n\t"
       "vpbroadcastd %%xmm4 , %%xmm6 \n\t" 
       "movq $2 , %%rcx           \n\t"
       "vmovd  %%rcx , %%xmm4     \n\t"
       "vpbroadcastd %%xmm4 , %%xmm7 \n\t" 
       "movq $3 , %%rcx           \n\t"
       "vmovd  %%rcx , %%xmm4     \n\t"
       "vpbroadcastd %%xmm4 , %%xmm8 \n\t" 
       "vshufps $0x0 , %%xmm5 , %%xmm6 , %%xmm6   \n\t"
       "vshufps $0x0 , %%xmm7 , %%xmm8 , %%xmm8   \n\t"
       "vshufps $0x88  , %%xmm6 , %%xmm8 , %%xmm8 \n\t"

       "vpaddd   %%xmm2 , %%xmm8 , %%xmm8  \n\t"
       "vpand    %%xmm8 , %%xmm3 , %%xmm3  \n\t"
       "vpermd   %%ymm1 , %%ymm3 , %%ymm3  \n\t"
       "vmovdqu  %%xmm3 , %0 \n\t"
     : "+m"(*arr)
     : "m"(N) , "m"(VL)
     :
   );
  printA(arr, VL+1);
  return arr;
} 

int main() {
  int arr [] = { 10,20,30,40};
  int N = 2;
  int VL = 4;
  rotateEL_VecY_TypeI(VL, N , arr);
  return 0;
}
