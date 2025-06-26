  
#include "stdio.h"  
#include "stdint.h"

__attribute__((noinline))
int compare32_byte(int8_t* src1, int8_t* src2, long length) {
  long index;
  asm volatile(
    "movq      $1 , %%rax          \n\t"              // MaskGen
    "shlx      %3 , %%rax , %%rax  \n\t"
    "decq      %%rax               \n\t"
    "kmovq     %%rax , %%k1        \n\t"

    "knotq     %%k1  , %%k3        \n\t"              // MaskOper

    "vmovdqu8  %1 , %%ymm1 {{%%k1}}         \n\t"     // Maskload : Type specific(8/16/32/64).

    "mov       $-1,  %0            \n\t"              // MaskCompare 
    "vpcmpb    $0, %2, %%ymm1 , %%k2 {{%%k1}}  \n\t"  // Type specific compare(8/16/32/64).
    "kortestq  %%k3 , %%k2         \n\t"
    "jc        DONE                \n\t"
    "kmovq     %%k2 , %0           \n\t"
    "notq      %0                  \n\t"
    "tzcnt     %0  , %0            \n\t"
    "DONE:                         \n\t"
    : "+r"(index)
    : "m"(*src1) , "m"(*src2) , "r"(length)
    : "cc", "%rax", "%ymm1",  "%k1", "%k2", "k3"
  );
  return index;
}

int main() {
  int8_t src1[] = {10,20,30,40,60};  
  int8_t src2[] = {10,20,30,40,50};  
  int index = compare32(src1, src2, sizeof(src1)/sizeof(int8_t));
  return printf("mismatch index = %d\n" , index); 
}
