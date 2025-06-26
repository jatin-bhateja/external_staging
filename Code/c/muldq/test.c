
#include <stdio.h>

/*
    int vlen_enc = vector_length_encoding(this);
    // Get the lo-hi products, only the lower 32 bits is in concerns
    __ vpshufd($xtmp1$$XMMRegister, $src2$$XMMRegister, 0xB1, vlen_enc);
    __ vpmulld($xtmp1$$XMMRegister, $src1$$XMMRegister, $xtmp1$$XMMRegister, vlen_enc);
    __ vpshufd($xtmp2$$XMMRegister, $xtmp1$$XMMRegister, 0xB1, vlen_enc);
    __ vpaddd($xtmp2$$XMMRegister, $xtmp2$$XMMRegister, $xtmp1$$XMMRegister, vlen_enc);
    __ vpsllq($xtmp2$$XMMRegister, $xtmp2$$XMMRegister, 32, vlen_enc);
    // Get the lo-lo products
    __ vpmuludq($xtmp1$$XMMRegister, $src1$$XMMRegister, $src2$$XMMRegister, vlen_enc);
    __ vpaddq($dst$$XMMRegister, $xtmp1$$XMMRegister, $xtmp2$$XMMRegister, vlen_enc);

*/
long micro1(long src1, long src2) {
  long res = 0;
  asm volatile (
      "movq %2, %%rax                    \n\t"
      "movq $4294967295, %%rbx           \n\t"
      "andq %%rbx, %%rax                 \n\t" 
      "andq %%rbx, %1                    \n\t" 
      "movq %1,  %%xmm1                  \n\t"
      "movq %%rax, %%xmm2                \n\t"
      "vpshufd $0xB1, %%xmm2, %%xmm3     \n\t"
      "vpmulld %%xmm3, %%xmm1, %%xmm3    \n\t"
      "vpshufd $0xB1, %%xmm3, %%xmm4     \n\t"
      "vpaddd %%xmm3, %%xmm4, %%xmm4     \n\t" 
      "vpsllq $32, %%xmm4, %%xmm4        \n\t"
      "vpmuludq %%xmm1,  %%xmm2,  %%xmm1 \n\t"
      "vpaddq  %%xmm4,  %%xmm1,  %%xmm1  \n\t"
      "movq %%xmm1, %0                   \n\t"
    : "=r"(res)
    : "r"(src1) , "r"(src2)
    : "cc" , "%xmm1" , "%xmm2", "%xmm3", "%xmm4"
  );
  return res;
}

long micro2(long src1, long src2) {
  long res = 0;
  asm volatile (
      "movq %1,  %%xmm1                \n\t"
      "movq %2,  %%xmm2                \n\t"
      "vpmuludq %%xmm2, %%xmm1, %%xmm1 \n\t"
      "movq %%xmm1, %0                 \n\t"
    : "=r"(res)
    : "r"(src1) , "r"(src2)
    : "cc" , "%xmm1", "%xmm2", "%rax", "%rbx"
  );
  return res;
}


int main() {
  long src1 = 0xAAAAAAAA;
  long src2 = 0xCCCCCCCC;
  printf("res1 = %ld\n", micro1(src1, src2));
  return printf("res2 = %ld\n", micro2(src1, src2));
}
