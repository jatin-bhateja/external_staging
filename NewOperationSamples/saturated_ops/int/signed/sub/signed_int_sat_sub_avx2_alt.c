#include <stdio.h>

//
//  using sign bit test.
//  res = do_signed_sub
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
   int res[8];
  int arr1[] =  {
     // MIN_VAL   MAX_VAL
     0x80000000, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };

  int arr2[] =  {
     //MIN-(-2)    MAX-(-2)     MIN - 1      MAX - 1
     -2,           -2,           1,           1,
     1,1,1,1,
  };
   int min_val[8] = {
     -2147483648, -2147483648, -2147483648, -2147483648,
     -2147483648, -2147483648, -2147483648, -2147483648,
   };
   int max_val[8] = {
     2147483647, 2147483647, 2147483647, 2147483647,
     2147483647, 2147483647, 2147483647, 2147483647,
   };
   for (int i = 0; i < 900000000; i++) {
   asm volatile (
      "vmovdqu %1, %%ymm1           \n\t"
      "vmovdqu %2, %%ymm2           \n\t"
      "vpcmpeqd %%ymm6, %%ymm6, %%ymm6 \n\t"
      "vpsubd %%ymm2, %%ymm1, %%ymm3  \n\t"
      // sign mask based on result sign bit.
      "vpsrad $31, %%ymm3, %%ymm5     \n\t"
      // mask for opposite sign inputs.
      "vpxor %%ymm2, %%ymm1, %%ymm4   \n\t"
      "vpsrad $31, %%ymm4, %%ymm4     \n\t"
      // sign mask for first input since subtraction is non-commutative operation.
      "vpsrad $31, %%ymm1, %%ymm7     \n\t"
      // find the result lanes corresponding to opposite sign inputs whose sign does comply with first input sign.
      "vpxor %%ymm7, %%ymm5, %%ymm5   \n\t"
      "vpandd %%ymm5, %%ymm4 , %%ymm4 \n\t"
      // replacment lane for -ve OOB.
      "vpandd %%ymm7, %%ymm4 , %%ymm5 \n\t"
      // replace result lanes corresponding to opposite sign inputs where sign flipped w.r.t first input sign with Integer.MIN_VALUE for +ve numbers else Integer.MAX_VALUE.
      "vmovdqu %3, %%ymm7 \n\t"
      "vmovdqu %4, %%ymm8 \n\t"
      // if value at replacment result lane is +ve then replacit it by MIN_VALUE else with MAX_VALUE
      // replacment mask for +ve OOB.
      "vpandn %%ymm4, %%ymm5, %%ymm6  \n\t"
      "vpblendvb %%ymm5, %%ymm7, %%ymm3, %%ymm3 \n\t"
      "vpblendvb %%ymm6, %%ymm8, %%ymm3, %%ymm3 \n\t"
      "vmovdqu %%ymm3, %0           \n\t"
     : "=m"(res[0])
     : "m"(arr1[0]), "m"(arr2[0]), "m"(min_val), "m"(max_val)
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7", "%ymm8"
   );
   }
   return printf("{%d, %d, %d, %d...}\n", res[0], res[1], res[2], res[3]);
}

