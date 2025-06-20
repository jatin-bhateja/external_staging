
#include "stdio.h"

char * cmem = "ABCDEFGH";
int * imem;

__attribute__((noinline))
void loadArr() {
   asm volatile (
      "vpmovsxbd  %1 ,  %%xmm0 \n\t"
      "vmovdqu  %%xmm0  , %0   \n\t"
    : "=m"(imem)
    : "m"(cmem) 
    : "%xmm0"
   );
}

int main () {
  int arr[4] = {0,0,0,0};
  imem = arr;
  loadArr();
  for(int i = 0; i < 4 ;i++)
    printf("%d " , arr[i]);
  printf("\n");
  return 0;
}
