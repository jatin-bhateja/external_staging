
#include "stdio.h"

void clz_long(long * res, long * src, int len) {
  for(int i=0 ; i<len ; i+=4) {
    asm volatile(
      "vmovdqu %1, %%ymm2 \n\t"
      "vpxor %%ymm3, %%ymm3, %%ymm3 \n\t"
      "vpxor %%ymm4, %%ymm4, %%ymm4 \n\t"
      "vpextrq $0, %%xmm2, %%rax \n\t"
      "lzcnt %%rax, %%rax \n\t"
      "vpinsrq $0, %%rax, %%xmm3, %%xmm3 \n\t"
      "vpextrq $1, %%xmm2, %%rax \n\t"
      "lzcnt %%rax, %%rax \n\t"
      "vpinsrq $1, %%rax, %%xmm3, %%xmm3 \n\t"
      "vpermq $0x4e, %%ymm2, %%ymm2 \n\t"
      "vpextrq $0, %%xmm2, %%rax \n\t"
      "lzcnt %%rax, %%rax \n\t"
      "vpinsrq $0, %%rax, %%xmm4, %%xmm4 \n\t"
      "vpextrq $1, %%xmm2, %%rax \n\t"
      "lzcnt %%rax, %%rax \n\t"
      "vpinsrq $1, %%rax, %%xmm4, %%xmm4 \n\t"
      "vinserti128 $1, %%xmm4, %%ymm3, %%ymm3 \n\t"
      "vmovdqu %%ymm3 , %0 \n\t" 
     : "=m"(res[i])
     : "m"(src[i])
     : "%ymm1" , "%ymm2", "%ymm3" ,"%rax", "%ymm4"
    );
  }
}

int main() {
  long arr[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  long res[16];
  clz_long(res, arr, 16);
  for(int i = 0 ; i < 16; i++) {
    printf("arr[%d]=%ld : res[%d]=%ld\n",i,arr[i],i,res[i]); 
  }
  return 0;
}

