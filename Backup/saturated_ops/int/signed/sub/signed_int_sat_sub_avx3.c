
#include <stdio.h>

int main() {
  int val1[] =  {
     0x80000000, 0x80000000, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };
  int val2[] =  {
     0,1,1,1,
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
  for (int i = 0; i < 9000000; i++) {
    asm volatile (
      "vmovdqu32 %1, %%zmm1           \n\t"
      "vmovdqu32 %2, %%zmm2           \n\t"
      "vpmovsxdq %%ymm1, %%zmm3       \n\t"
      "vpmovsxdq %%ymm2, %%zmm4       \n\t"
      "vpsubq %%zmm4, %%zmm3, %%zmm4  \n\t"
      "vpmovsqd %%zmm4, %%ymm4        \n\t"
      "vextracti64x4 $0x1, %%zmm1, %%ymm5   \n\t"
      "vextracti64x4 $0x1, %%zmm2, %%ymm6   \n\t"
      "vpmovsxdq %%ymm5, %%zmm5       \n\t"
      "vpmovsxdq %%ymm6, %%zmm6       \n\t"
      "vpsubq %%zmm6, %%zmm5, %%zmm6  \n\t"
      "vpmovsqd %%zmm6, %%ymm6        \n\t"
      "vinserti64x4 $0x1, %%ymm6, %%zmm4, %%zmm4 \n\t"
      "vmovdqu64 %%zmm4, %0           \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%zmm6"
    );
  }

  return printf("{res[0], res[1]} = {%d, %d}\n", res[0], res[1]); 
}
