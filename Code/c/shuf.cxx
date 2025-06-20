
#include<chrono>
#include "stdio.h"
#include "stdlib.h"

long shuffle1[] = {4,5,4,5,4,5,4,5};
long shuffle2[] = {6,7,6,7,6,7,6,7};

char swap_lanes1(char* dst, char* src, int idx) {
  asm volatile(
     "vmovdqu64  %2 , %%zmm2 \n\t"
     "vpermq    %1, %%zmm2, %%zmm1 \n\t" 
     "vmovdqu64 %%zmm1, %0     \n\t"
   : "=m"(*dst)
   : "m"(*src), "m"(*shuffle1)
   : "%zmm1" , "%zmm2"
  );
  return dst[idx];
}

/*
  vpermq(xtmp3, src,  0x44, vlen_enc);
  vextracti64x4_high(xtmp3, xtmp3);
  vinserti64x4(xtmp3, xtmp3, xtmp3, 0x1);
*/

char swap_lanes2(char* dst, char* src, int idx) {
  asm volatile(
     "vpermq $0x44, %1, %%zmm1 \n\t"
     "vextracti64x4 $0x1, %%zmm1, %%ymm1 \n\t"
     "vinserti64x4 $0x1, %%ymm1, %%zmm1, %%zmm1 \n\t"
     "vmovdqu64 %%zmm1, %0     \n\t"
   : "=m"(*dst)
   : "m"(*src)
   : "%zmm1" 
  );
  return dst[idx];
}

int main(int argc, char * argv[]) {
  char dst[64];
  char src[64];
  if (argc < 2 ) {
    return fprintf(stderr, "Incorrect arguments!\n");
  }
  int algo = atoi(argv[1]);
   
  for(int i = 0; i < 64; i++) {
    src[i] = i;
  }

  printf("src = ");
  for(int i = 0 ; i < 16; i++) {
    printf(" %d ", src[i]);
  }
  printf("\n");
  
  if (algo == 0) {
     //Warmup
     for(int i = 0 ; i < 90000000; i++) {
       swap_lanes1(dst, src, i&63); 
     }
     long res = 0L;
     auto start = std::chrono::steady_clock::now();
     for(int i = 0 ; i < 90000000; i++) {
       res += swap_lanes1(dst, src, i&63); 
     }
     auto end = std::chrono::steady_clock::now();
     std::chrono::duration<double> diff = end - start;
     printf("[SWAP LANES Perm Table Time] %lfs  [Res] %ld\n" , diff.count(), res);
     printf("\n");
   
     printf("dst = ");
     for(int i = 0 ; i < 16; i++) {
       printf(" %d ", dst[i]);
     }
     printf("\n");
  } else {
   
     //Warmup
     for(int i = 0 ; i < 90000000; i++) {
       swap_lanes2(dst, src, i&63); 
     }
     long res = 0L;
     auto start = std::chrono::steady_clock::now();
     for(int i = 0 ; i < 90000000; i++) {
       res += swap_lanes2(dst, src, i&63); 
     }
     auto end = std::chrono::steady_clock::now();
     std::chrono::duration<double> diff = end - start;
     printf("[SWAP LANES Inst/Extr Time] %lfs  [Res] %ld\n" , diff.count(), res);
     printf("\n");
   
     printf("dst = ");
     for(int i = 0 ; i < 16; i++) {
       printf(" %d ", dst[i]);
     }
     printf("\n");
  }
}
