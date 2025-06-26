
#include <stdio.h>

int main() {
  unsigned int val1[] =  {
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
  };
  unsigned int val2[] =  {
     17,2,2,2,
     17,2,2,2,
  };


  // addition / subtraction works over 2s complement representation and is agnostic to signed / unsigned value.
  unsigned int res[8];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu %1, %%ymm1              \n\t"
       "vmovdqu %2, %%ymm2              \n\t"
       // Res = Signed Add INP1, INP2
       "vpaddd %%ymm1, %%ymm2, %%ymm3   \n\t"
       // Max_Unsigned = 0xFFFFFFFF
       "vpcmpeqd %%ymm4, %%ymm4, %%ymm4 \n\t"
       

       //
       // Overflow => (Long.UNSIGNED_MAX_VALUE - Max(A,B)) <u Min(A,B)
       // a <u b   => (a + Long.MIN_VALUE)                 <s (b + Long.MIN_VALUE)
       // Signed to Unsigned => Flip the sign bit
       // Unsigned to Signed => Unsigned + SIGNED_MIN 

       // SMax                 0                  SMin
       //  |-------------------|-------------------|
       // 
       // UMax                                    UMin(0)
       //  |---------------------------------------|
       //
       // 
       //> Signed compare:  Mask = X_Signed < Min_signed
       "vpslld $31, %%ymm4, %%ymm5        \n\t"
       "vpaddd %%ymm5, %%ymm3, %%ymm5     \n\t"
       "vpaddd %%ymm5, %%ymm4, %%ymm6     \n\t"
       "vpcmpgtd %%ymm5, %%ymm6, %%ymm5   \n\t"
       //<
       // res  = X < Min_Unsigned ? Max_Unsigned : Res
       "vpblendvb %%ymm5, %%ymm3, %%ymm4, %%ymm4 \n\t"
       "vmovdqu %%ymm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7",  "%rax"
    );
  }

  return printf("{res[0], res[1], res[2], res[3]} = {%d, %d, %d, %d}\n", res[0], res[1], res[2], res[3]); 
}
