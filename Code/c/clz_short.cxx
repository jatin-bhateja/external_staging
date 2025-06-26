#include <stdio.h>
#include <chrono>
#include <stdlib.h>

#define LEN 2048
#define ITER 100000

char zc_lut[] = { 
  4,3,2,2,1,1,1,1,0,0,0,0,0,0,0,0,4,3,2,2,1,1,1,1,0,0,0,0,0,0,0,0,
  4,3,2,2,1,1,1,1,0,0,0,0,0,0,0,0,4,3,2,2,1,1,1,1,0,0,0,0,0,0,0,0
};

#if 0
int clz_scalar(int * res, int * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i++) {
    asm volatile(
       "lzcnt %1 , %%rax \t\n"
       "movq %%rax, %0   \t\n"
      : "=m"(res[i])
      : "m"(arr[i])
      : "%rax"
    );
  }
  return res[ctr];
}
#endif

long perm_mask [] = {
  0L, 4L, 1L, 5L, 2L, 6L, 3L , 7L
}; 
/*
//All AVX3 targets supporting AVX512F/CD
short clz_avx3(short * res, short * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i+=32) {
    asm volatile(
       "mov $0x10 , %%rax \t\n"
       "vpbroadcastd %%eax, %%zmm4 \t\n"
       "vpxorq %%zmm1, %%zmm1 , %%zmm1 \t\n"
       "vmovdqu64  %1 , %%zmm2 \t\n"
       "vpunpcklwd %%zmm1 , %%zmm2 , %%zmm3 \t\n"
       "vplzcntd   %%zmm3 , %%zmm3 \t\n"
       "vpsubd %%zmm4, %%zmm3, %%zmm3 \t\n"
       "vpmovdw %%zmm3, %%ymm3 \t\n"
       "vpunpckhwd %%zmm1 , %%zmm2 , %%zmm1 \t\n" 
       "vplzcntd   %%zmm1 , %%zmm1 \t\n"
       "vpsubd %%zmm4, %%zmm1, %%zmm1 \t\n"
       "vpmovdw %%zmm1, %%ymm1 \t\n"
       "vinserti64x4 $1 , %%ymm1, %%zmm3, %%zmm3 \t\n"
       "vmovdqu64 %2, %%zmm2 \t\n"
       "vpermq %%zmm3, %%zmm2 , %%zmm3 \t\n"
       "vmovdqu64  %%zmm3, %0   \t\n"
      : "=m"(res[i])
      : "m"(arr[i]), "m"(*perm_mask)
      : "%rax" , "%zmm1" , "%zmm2" , "%zmm3", "%zmm4"
    );
  }
  return res[ctr];
}
*/

//All AVX3 targets supporting AVX512F/CD
short clz_avx3(short * res, short * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i+=32) {
      asm volatile(
          "vpternlogd $0xff, %%zmm1, %%zmm1, %%zmm1 \n\t"
          "vmovdqu64  %1 , %%zmm2 \t\n"
          "vpunpcklwd %%zmm2 , %%zmm1 , %%zmm3 \t\n"
          "vplzcntd   %%zmm3 , %%zmm3 \t\n"
          "vpunpckhwd %%zmm2 , %%zmm1 , %%zmm1 \t\n"
          "vplzcntd   %%zmm1 , %%zmm1 \t\n"
          "vpackusdw %%zmm1, %%zmm3, %%zmm3\t\n"
          "vmovdqu64  %%zmm3, %0   \t\n"
          : "=m"(res[i])
          : "m"(arr[i]), "m"(*perm_mask)
          : "%rax", "%zmm1", "%zmm2", "%zmm3", "%zmm4"
          );
  }
  return res[ctr];
}

// AVX512BW constrained.
short clz_avx3_alt(short * res, short * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i+=32) {
    asm volatile(
       "vmovdqu64        %1 , %%zmm3    \t\n"
       "vmovdqu64        %2 , %%zmm0    \t\n"
       "mov            $15, %%rax     \t\n"
       "vpbroadcastb %%eax, %%zmm1    \t\n"
       "vpxorq	%%zmm2, %%zmm2, %%zmm2 \t\n"
       "vpshufb	%%zmm3, %%zmm0, %%zmm4 \t\n"
       "vpsrlw	$4, %%zmm3, %%zmm5 \t\n"
       "vpandq	%%zmm1, %%zmm5, %%zmm6 \t\n"
       // If upper 4 bits are zeros then add lower 4bit leading zero count.
       "vpcmpeqb  %%zmm2, %%zmm6, %%k1 \t\n"
       "vpshufb	%%zmm5, %%zmm0, %%zmm5 \t\n"
       "vpaddb	%%zmm5, %%zmm4, %%zmm5 %{{%%k1}} \t\n"
       // If upper 8 bits are all zeros then add leading zero count of lower 8bits to it.
       "vpsrlw	$8, %%zmm3, %%zmm3 \t\n"
       "vpcmpeqb %%zmm2, %%zmm3, %%k1 \t\n"
       "vpsrlw	$8, %%zmm5, %%zmm6 \t\n"
       "mov $0xFF, %%rax \t\n"
       "vpbroadcastw %%eax, %%zmm1  \t\n"
       "vpandq	%%zmm1, %%zmm5, %%zmm5 \t\n"
       "vpaddb	%%zmm5, %%zmm6, %%zmm6 %{{%%k1}} \t\n"
       "vmovdqu64	%%zmm6, %0 \t\n"
      : "=m"(res[i])
      : "m"(arr[i]), "m"(*zc_lut)
      : "%rax" , "%zmm0" , "%zmm1" ,"%zmm2" , "%zmm3" , "%zmm4" ,"%zmm5" ,"%zmm6", "%k1"
    );
  }
  return res[ctr];
}

short clz_avx2(short * res, short * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i+=16) {
    asm volatile(
       "vmovdqu        %1 , %%ymm3    \t\n"
       "vmovdqu        %2 , %%ymm0    \t\n"
       "mov            $15, %%rax     \t\n"
       "movd           %%rax, %%xmm2  \t\n"    
       "vpbroadcastb %%xmm2, %%ymm1    \t\n"
       "vpxor	%%ymm2, %%ymm2, %%ymm2 \t\n"
       "vpshufb	%%ymm3, %%ymm0, %%ymm4 \t\n"
       "vpsrlw	$4, %%ymm3, %%ymm5 \t\n"
       "vpand	%%ymm1, %%ymm5, %%ymm5 \t\n"
       "vpcmpeqb  %%ymm2, %%ymm5, %%ymm6 \t\n"
       "vpand	%%ymm6, %%ymm4, %%ymm4 \t\n"
       "vpshufb	%%ymm5, %%ymm0, %%ymm5 \t\n"
       "vpaddb	%%ymm5, %%ymm4, %%ymm4 \t\n"
       "vpcmpeqb %%ymm2, %%ymm3, %%ymm5 \t\n"
       "vpsrlw	$8, %%ymm5, %%ymm5 \t\n"
       "vpand	%%ymm5, %%ymm4, %%ymm5 \t\n"
       "vpsrlw	$8, %%ymm4, %%ymm4 \t\n"
       "vpaddw	%%ymm5, %%ymm4, %%ymm4 \t\n"
       "vmovdqu	%%ymm4, %0 \t\n"
      : "=m"(res[i])
      : "m"(arr[i]), "m"(*zc_lut)
      : "%rax" , "%ymm0" , "%ymm1" ,"%ymm2" , "%ymm3" , "%ymm4" ,"%ymm5" ,"%ymm6"
    );
  }
  return res[ctr];
}

int main(int argc, char * argv[]) {
  int r = 0;
  short arr[LEN];
  short res[LEN];

  int algo = atoi(argv[1]);

  for(int i = 0 ; i < LEN; i++ ) {
    arr[i] = (short)i;
  }

  if ( algo == 0) {
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx2(res, arr, LEN, i&(LEN-1));
     }
   
     r = 0;
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx2(res, arr, LEN, i&(LEN-1));
     }
     auto end = std::chrono::steady_clock::now();
   
     std::chrono::duration<double> diff = end - start;
     printf("\n\n[VectorAVX2 Time] %lfs  [Res] %d\n" , diff.count(), r);
   
     for(int i = 0; i < 8 ; i++) {
       printf("res[%d] = %d\n", i, res[i]);
     }
  } else if ( algo == 1 ) { 
     
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx3(res, arr, LEN, i&(LEN-1));
     }
   
     r = 0;
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx3(res, arr, LEN, i&(LEN-1));
     }
     auto end = std::chrono::steady_clock::now();
   
     std::chrono::duration<double> diff = end - start;
     printf("\n\n[VectorAVX3 VLZCNTD BASED Time] %lfs  [Res] %d\n" , diff.count(), r);
   
     for(int i = 0; i < 8 ; i++) {
       printf("res[%d] = %d\n", i, res[i]);
     }
  } else if ( algo == 2 ) { 
   
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx3_alt(res, arr, LEN, i&(LEN-1));
     }
   
     r = 0;
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 1000000; i++) {
        r +=  clz_avx3_alt(res, arr, LEN, i&(LEN-1));
     }
     auto end = std::chrono::steady_clock::now();
   
     std::chrono::duration<double> diff = end - start;
     printf("\n\n[VectorAVX3 LUT BASED  Time] %lfs  [Res] %d\n" , diff.count(), r);
   
     for(int i = 0; i < 8 ; i++) {
       printf("res[%d] = %d\n", i, res[i]);
     }
  }

#if 0
  for (int i = 0; i < 1000000; i++) {
     r +=  clz_scalar(res, arr, LEN, i&(LEN-1));
  }

  r = 0;
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 1000000; i++) {
     r +=  clz_scalar(res, arr, LEN, i&(LEN-1));
  }
  end = std::chrono::steady_clock::now();

  diff = end - start;
  printf("\n\n[Scalar Time] %lf  [Res] %d\n" , diff.count(), r);

  for(int i = 0; i < 8 ; i++) {
    printf("res[%d] = %d\n", i, res[i]);
  }
#endif
}

