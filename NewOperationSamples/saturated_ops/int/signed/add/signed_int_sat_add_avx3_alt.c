#include <stdio.h>

//
//  using sign bit test.
//  res = do_signed_add
//  if (same_sign) {
//     if (sign_flip) {
//        if (neg_num) {
//           res = underdlow -> saturate at Integer.MIN_VALUE
//        } else {
//           res = overflow  -> saturate at Integet.MAX_VALUE
//        } 
//     }
//  }
//  yeild res
//
//  0 0 0  1
//  1 1 1  0
//  
//
int main (int argc, char* argv[]) {
   int res[16];
  int arr1[] =  {
     // MIN_VAL   MAX_VAL
     0x80000000, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };

  int arr2[] =  {
     //MIN-2    MAX+(2)     MIN + 1      MAX + 1
     -2,           2,           1,           1,
     1,1,1,1,
     1,1,1,1,
     1,1,1,1,
  };

   int min_val[16] = {
     -2147483648, -2147483648, -2147483648, -2147483648,
     -2147483648, -2147483648, -2147483648, -2147483648,
     -2147483648, -2147483648, -2147483648, -2147483648,
     -2147483648, -2147483648, -2147483648, -2147483648
   };
   int max_val[16] = {
     2147483647, 2147483647, 2147483647, 2147483647,
     2147483647, 2147483647, 2147483647, 2147483647,
     2147483647, 2147483647, 2147483647, 2147483647,
     2147483647, 2147483647, 2147483647, 2147483647
   };
   for (int i = 0; i < 900000000; i++) {
   asm volatile (
      "vmovdqu32 %1, %%zmm1           \n\t"
      "vmovdqu32 %2, %%zmm2           \n\t"
      "vpxord %%zmm6, %%zmm6, %%zmm6 \n\t"
      "vpaddd %%zmm1, %%zmm2, %%zmm3  \n\t"
      // sign mask based on result sign bit.
      "vpsrad $31, %%zmm3, %%zmm5     \n\t"
      // mask for same sign inputs.
      "vpxord %%zmm2, %%zmm1, %%zmm4   \n\t"
      "vpsrad $31, %%zmm4, %%zmm4     \n\t"
      "vpcmpeqd %%zmm4, %%zmm6 , %%k1 \n\t"
      // sign mask for one of the input of same sign inputs.
      "vpsrad $31, %%zmm1, %%zmm4     \n\t"
      // find the result lanes corresponding to same sign inputs whose sign flipped.
      "vpcmpd $4, %%zmm5, %%zmm4, %%k2 %{%%k1} \n\t"
      // replace result lanes corresponding to same sign inputs where sign flipped with saturated value (Integer.MIN_VALUE for -ve numbers else Integer.MAX_VALUE)
      "vmovdqu32 %3, %%zmm7 \n\t"
      "vmovdqu32 %4, %%zmm8 \n\t"
      // if value at replacment result lane is +ve then replacit it by MIN_VALUE else with MAX_VALUE
      "vpcmpeqd %%zmm5, %%zmm6, %%k3 %{%%k2}  \n\t"
      "kandnw %%k2, %%k3, %%k4              \n\t"
      "vpblendmd %%zmm7, %%zmm3 , %%zmm3 %{%%k3} \n\t"
      "vpblendmd %%zmm8, %%zmm3 , %%zmm3 %{%%k4} \n\t"
      "vmovdqu64 %%zmm3, %0           \n\t"
     : "=m"(res[0])
     : "m"(arr1[0]), "m"(arr2[0]), "m"(min_val), "m"(max_val)
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%zmm6", "%zmm7", "%zmm8", "%k1", "%k2", "%k3", "%k4"
   );
   }
   return printf("{%d, %d,%d , %d ...}\n", res[0], res[1], res[2], res[3]);
}

