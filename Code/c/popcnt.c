#include "stdio.h"
#include "stdlib.h"

char shuf_index[16] = {
   8,9,10,11,12,13,14,15,
   8,9,10,11,12,13,14,15
}; 

long popcnt_scalar(char* mask, int len) {
  int ctr = 0;
  for(int i = 0 ; i < len; i++) {
     if (mask[i] == 1)
        ctr++;
  }
  return ctr;
}

long popcnt_evex(char * mask, int len) {
  long out = 0;
  asm volatile(
    "vmovdqu  %1 , %%ymm0  \n\t"
    "vpxor  %%ymm1 , %%ymm1  , %%ymm1\n\t"
    "vpsubb  %%ymm0 , %%ymm1, %%ymm1 \n\t"
    "vpmovb2m %%ymm1, %%k1 \n\t"
    "kmovq %%k1 , %%rcx    \n\t"
    "popcnt %%rcx , %%rax  \n\t"
    "mov    %%rax , %0   \n\t"
   : "=r"(out)
   : "m"(*mask)
   : "%rcx" , "%rax" , "%k1", "%xmm0"
  );
  return out;
}

long popcnt_avx(char * mask, int len) {
  long out = 0;
  asm volatile(
    "vmovdqu  %1   , %%ymm0  \n\t"
    "vpxor    %%ymm1, %%ymm1 , %%ymm1  \n\t"
    "vpsubb  %%ymm0 , %%ymm1, %%ymm0 \n\t"
    "vmovdqu %%ymm0 , %%ymm1 \n\t"
    "vpmovmskb %%ymm1 , %%rcx \n\t"
    "popcnt %%rcx , %%rax  \n\t"
    "mov    %%rax , %0   \n\t"
   : "=r"(out)
   : "m"(*mask) , "m"(*shuf_index)
   : "%rcx" , "%rax" , "%rbx", "%k1", "%ymm0", "%ymm1" , "%ymm2"
  );
  return out;
}

int main(int argc, char * argv[]) {
  long out = 0;
  char in[64];
  int algo = atoi(argv[1]);
  int len  = atoi(argv[2]);
  for(int i = 0 ; i < len; i++) {
     in[i] = i & 1 ? 1 : 0;
  }  
  if (algo == 0 ) {
    for (int i = 0 ; i < 10000000; i++) {
       out += popcnt_scalar(in, len);
    }
  }
  else if (algo == 1)
    for (int i = 0 ; i < 10000000; i++) {
      out += popcnt_avx(in, len);
    }
  else
    for (int i = 0 ; i < 10000000; i++) {
      out += popcnt_evex(in, len);
    }
  return printf("truecnt  =  %ld\n", out);
}
