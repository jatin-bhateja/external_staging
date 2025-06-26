
#include <stdio.h>
#include <stdint.h>

int main() {
  int val1[] =  {
     // MIN_VAL   MAX_VAL
     0x80000000, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };
   
  int val2[] =  {
     //MIN-(-2)    MAX-(-2)     MIN - 1      MAX - 1
     -2,           -2,           1,           1,
     1,1,1,1,
     1,1,1,1,
     1,1,1,1,
  };

  // Signed value ranges covers both +ve and -ve number.
  //  +ve + Max => upper saturation bound.
  //  -ve + -Min => lower saturation bound.
  //  +ve + -Min => in value range.
  //  Max + -ve => in value range.
  //  
  //     US_MAX_INT                                            0
  //         |-------------------------------------------------|
  //         |        |   |          |                         |
  //      MAX_INT     A   B          0                        MIN_INT
  //  
  //  Unsigned = Signed + MIN_INT / flip_sign Signed.
  //  Unsigned_Zero = 0 + MIN_INT  
  //  Max_Input = Max(A,B)
  //  Min_Input = Min(A,B)
  //  
  //  if ( US_MAX_INT - Max_Input < Unsigned_Input B)  return 0xFFFFFF
  //  else if ( Unsigned_Min_Input 
  int res[16];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
      "vmovdqu %1, %%ymm1           \n\t"
      "vmovdqu %2, %%ymm2           \n\t"
      "vpmovsxdq %%xmm1, %%ymm3       \n\t"
      "vpmovsxdq %%xmm2, %%ymm4       \n\t"
      "vpsubq %%ymm4, %%ymm3, %%ymm4  \n\t"
      "vpmovsqd %%ymm4, %%xmm4        \n\t"
      "vextracti128 $0x1, %%ymm1, %%xmm5   \n\t"
      "vextracti128 $0x1, %%ymm2, %%xmm6   \n\t"
      "vpmovsxdq %%xmm5, %%ymm5       \n\t"
      "vpmovsxdq %%xmm6, %%ymm6       \n\t"
      "vpsubq %%ymm6, %%ymm5, %%ymm6  \n\t"
      "vpmovsqd %%ymm6, %%xmm6        \n\t"
      "vinserti128 $0x1, %%xmm6, %%ymm4, %%ymm4 \n\t"
      "vmovdqu %%ymm4, %0           \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
    );
  }
  return printf("ACTUAL {res[0], res[1], res[2], res[3]} = {%d, %d, %d, %d}\n", res[0], res[1], res[2], res[3]); 
}
