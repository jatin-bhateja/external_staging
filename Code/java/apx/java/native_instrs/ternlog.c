
#include <stdio.h>

/*

 vpternlogq $0xff,0x10203040(%r20,%r21,8),%zmm23,%zmm24
 62 6b c1 40 25 84 ec 40 30 20 10 ff 

    EVEX     OP MR SIB   DISP     IMM
 -----------|--|--|--|-----------|---|
 62 6b c1 40 25 84 ec 40 30 20 10 ff


 COMPRESSED DISPLACEMENT USING DISP8*N SCHEME
 -----------------------------------------------------------------------------------------------------
 TupleType InputSize EVEX.W N (VL= 128) N (VL= 256) N (VL= 512)     Comment
 -----------------------------------------------------------------------------------------------------
 Full Mem   N/A       N/A        16            32       64          Load/store or subDword full vector
 -----------------------------------------------------------------------------------------------------

 N = 64
 DISP8 = OFFSET(64) / 64 = 0x1 
 vpternlogq $0xff,0x40(%r20,%r21,8),%zmm23,%zmm24
 62 6b c1 40 25 44 ec 01 ff 
                      __

 vpternlogq $0xff,0x10(%r20,%r21,8),%zmm23,%zmm24
 62 6b c1 40 25 84 ec 10 00 00 00 ff 

    EVEX     OP MR SIB   DISP     IMM
 -----------|--|--|--|-----------|---|
 62 6b c1 40 25 84 ec 10 00 00 00 ff
 lower                           higher 
 order                           order
 address byte                    address byte.

*/

//BSS
long arr[16];
long res[8];

void func() {
   long index = 4;
   asm volatile (
      "movq %1, %%r20                  \n\t"
      "movq %2, %%r21                  \n\t"
      "vpxorq %%zmm23, %%zmm23, %%zmm23 \n\t"
      "vpxorq %%zmm24, %%zmm24, %%zmm24 \n\t"
      "vpternlogq $0xFF, 0x40(%%r20, %%r21, 8), %%zmm23, %%zmm24 \n\t"
      "vmovdqu64 %%zmm24, %0           \n\t"
     : "=m"(res[0]) : "r"(arr), "r"(index) : "%r20", "%r21", "%r22", "%zmm23", "%zmm24"
   );
}

int main() {
 func();
 return printf("res = %ld\n", res[0]);
}
