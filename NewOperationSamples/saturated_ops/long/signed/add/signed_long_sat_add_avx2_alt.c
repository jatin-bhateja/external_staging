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
  long res[4];
  long arr1[] =  {
     // MIN_VAL   MAX_VAL
     0x8000000000000000, 0x7FFFFFFFFFFFFFFF, 0x8000000000000000, 0x7FFFFFFFFFFFFFFF,
  };

  long arr2[] =  {
     //MIN-2    MAX+(2)     MIN + 1      MAX + 1
     -2,           2,           1,           1,
  };

  long min_val[4] = {
     0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000
  };
  long max_val[4] = {
     0x7FFFFFFFFFFFFFFF, 0x7FFFFFFFFFFFFFFF, 0x7FFFFFFFFFFFFFFF, 0x7FFFFFFFFFFFFFFF
  };
  for (int i = 0; i < 900000000; i++) {
   asm volatile (
      "vmovdqu %1, %%ymm1           \n\t"
      "vmovdqu %2, %%ymm2           \n\t"
      "vpxorq %%ymm6, %%ymm6, %%ymm6 \n\t"
      "vpaddq %%ymm2, %%ymm1, %%ymm3  \n\t"
      // sign mask based on result sign bit.
      "vpsraq $63, %%ymm3, %%ymm5     \n\t"
      // mask for same sign inputs.
      "vpxor %%ymm2, %%ymm1, %%ymm4    \n\t"
      "vpsraq $63, %%ymm4, %%ymm4      \n\t"
      "vpcmpeqq %%ymm6, %%ymm4, %%ymm4 \n\t"
      // sign mask for one of the inputs of same polarity inputs, in this case choosing the first input.
      "vpsraq $63, %%ymm1, %%ymm7      \n\t"
      // find the result lanes corresponding to same polarity inputs whose sign does not comply with first input sign.
      "vpxor %%ymm7, %%ymm5, %%ymm5    \n\t"
      "vpandq %%ymm5, %%ymm4 , %%ymm4  \n\t"
      // replacment lane for -ve OOB.
      "vpandq %%ymm7, %%ymm4 , %%ymm5 \n\t"
      // replace result lanes corresponding to same polarity inputs where sign flipps w.r.t first input sign with Integer.MIN_VALUE for +ve numbers else Integer.MAX_VALUE.
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
   return printf("{%ld, %ld, %ld, %ld...}\n", res[0], res[1], res[2], res[3]);
}

