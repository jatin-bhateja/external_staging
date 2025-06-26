
#include "stdio.h"
#include "iacaMarks.h"

__attribute__((noinline))
void vector_masked_store(char * dst, double * src) {
  IACA_START;
  __asm__ volatile(
    "vmovdqu    %1       , %%ymm0 \n\t"
    "vcvtpd2dq  %%ymm0   , %%xmm1 \n\t"
    "vpackssdw  %%xmm1, %%xmm1 , %%xmm2 \n\t" 
    "vpacksswb  %%xmm2, %%xmm2 , %%xmm1 \n\t"
    "vpabsb     %%xmm1, %%xmm1          \n\t"
    "vmovdqu    %%xmm1 , %0     \n\t"  //  (4D to 4B)"
    : "=m"(*dst)
    : "m"(*src) 
    : "%ymm0" , "%xmm1" , "%xmm2" 
  );
  IACA_END;
}

__attribute__((noinline))
void vector_masked_store_alt(char * dst, double * src) {
  IACA_START;
  __asm__ volatile(
    "vmovdqu       %1   , %%ymm0                    \n\t"
    "vshufps      $0x88  , %%ymm0 , %%ymm0 , %%ymm1  \n\t"
    "vextractf128  $0x1  , %%ymm1 , %%xmm2           \n\t"
    "vblendps      $0xC  , %%ymm2  , %%ymm0 , %%ymm0 \n\t"
    "vpackusdw     %%ymm0 , %%ymm0 , %%ymm0   \n\t"
    "vpackuswb     %%ymm0 , %%ymm0,  %%ymm0   \n\t"
    "vmovdqu       %%xmm0 , %0                \n\t" 
    : "=m"(*dst)
    : "m"(*src) 
    : "%ymm0" , "%ymm1", "%ymm2", "%xmm0" 
  );
  IACA_END;
}

int main() {
  char  dst[4];
  double src[] = {-1.0,0.0,-1.0,0.0};

  vector_masked_store(dst, src);

  for(int i = 0 ;  i < sizeof(dst) ; i++)
    printf("%d \n", dst[i]);

  printf("\n\n");
  vector_masked_store_alt(dst, src);

  for(int i = 0 ;  i < sizeof(dst) ; i++)
    printf("%d \n", dst[i]);

  return dst[2];
}


