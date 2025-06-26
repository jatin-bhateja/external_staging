#include <stdio.h>
#include <chrono>

#define LEN 2048
#define ITER 100000

/*
    4bit
    0000  0
    0001  1
    0010  1
    0011  2
    0100  1
    0101  2
    0110  2
    0111  3
    1000  1
    1001  2
    1010  2
    1011  3
    1100  2
    1101  3
    1110  3
    1111  4
*/

char popc_table[] = {
  0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,
  0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4
};

int lower_4bits[] = {
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F, 
  0x0F0F0F0F
};

/*
int higher_4bits[] = {
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0, 
  0xF0F0F0F0
};
*/

int perm_vector[] = {
  0,2,4,6,0,0,0,0
}; 

int perm_vec1[] = {
 0,4,1,5,2,6,3,7
};
/*
// INT_LANE = B3B2B1B0
void popc_avx2(int * res, int * arr, int len) {
  for(int i = 0 ; i < len; i += 8) {
    asm volatile(
       "vpxor %%ymm3, %%ymm3, %%ymm3 \n\t"
       "vmovdqu %%ymm3, %%ymm8 \n\t"
       "vmovdqu %1, %%ymm0 \n\t"
       "vinserti128 $0 , %%xmm0 , %%ymm8 , %%ymm8\n\t"
       "vmovdqu %6 , %%ymm4 \n\t"  
       "vpermd %%ymm8, %%ymm4 , %%ymm4 \n\t"
       "vmovdqu %2, %%ymm1 \n\t"
       "vmovdqu %3, %%ymm2 \n\t"
       "vpand %%ymm2, %%ymm4 , %%ymm2 \n\t"
       "vpshufb %%ymm2, %%ymm1, %%ymm4 \n\t"
       "vpsadbw %%ymm3, %%ymm4, %%ymm4 \n\t"
       "vmovdqu %4, %%ymm2 \n\t"
       "vpand %%ymm2, %%ymm4 , %%ymm2 \n\t"
       "vpshufb %%ymm2, %%ymm1 , %%ymm5 \n\t"
       "vpsadbw %%ymm3 , %%ymm5 , %%ymm5 \n\t"
       "vpaddw %%ymm4 , %%ymm5 , %%ymm5 \n\t"
       "vextracti128 $0x1, %%ymm0 , %%xmm0 \n\t" 
       "vmovdqu %%ymm3, %%ymm8 \n\t"
       "vinserti128 $0 , %%xmm0 , %%ymm8 , %%ymm8\n\t"
       "vmovdqu %6 , %%ymm4 \n\t"  
       "vpermd %%ymm8, %%ymm4 , %%ymm4 \n\t"
       "vmovdqu %3, %%ymm2 \n\t"
       "vpand %%ymm2, %%ymm4 , %%ymm2 \n\t"
       "vpshufb %%ymm2, %%ymm1 , %%ymm4 \n\t"
       "vpsadbw %%ymm3 , %%ymm4 , %%ymm4 \n\t"
       "vmovdqu %4, %%ymm2 \n\t"
       "vpand %%ymm2, %%ymm4 , %%ymm2 \n\t"
       "vpshufb %%ymm2, %%ymm1 , %%ymm6 \n\t"
       "vpsadbw %%ymm3 , %%ymm6 , %%ymm6 \n\t"
       "vpaddw %%ymm6 , %%ymm5 , %%ymm6 \n\t"
       "vmovdqu %5 , %%ymm7 \n\t"
       "vpermd %%ymm7, %%ymm6 , %%ymm6 \n\t"
       "vpermd %%ymm7, %%ymm5 , %%ymm5 \n\t"
       "vinserti128 $0x1 , %%xmm6 , %%ymm5 , %%ymm5\n\t"
       "vmovdqu %%ymm5 , %0 \n\t"
      : "=m"(res[i])
      : "m"(arr[i]), "m"(*popc_table),  "m"(*lower_4bits) , "m"(*higher_4bits) , "m"(*perm_vector), "m"(*perm_vec1)
      : "%ymm0", "%ymm1", "%ymm2" , "%ymm3", "%ymm4", "%ymm5", "%ymm6" , "%ymm7", "%ymm8"
    );
  }
}

int micro(int * res, int * arr, int len, int ctr) {
  popc_avx2(res, arr, len);
  return res[ctr];
}
*/
  
int micro(int * res, int * arr, int len, int ctr) {
  for(int i = 0 ; i < len; i++) {
    //res[i] =  __builtin_ctz(arr[i]);
    //res[i] =  __builtin_clz(arr[i]);
    res[i] =  __builtin_popcount(arr[i]);
  }
  return res[ctr];
}
  
int main() {
  int r = 0;

  int arr[LEN];
  int res[LEN];

  for(int i = 0 ; i < LEN; i++ ) {
    arr[i] = i;
  }

  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 1000000; i++) {
     r +=  micro(res, arr, LEN, i&(LEN-1));
  }
  auto end = std::chrono::steady_clock::now();

  std::chrono::duration<double> diff = end - start;
  printf("[VectorAVX Time] %lf  [Res] %d\n" , diff.count(), r);
  printf("\n");
 
  for(int i = 0; i < 8 ; i++) {
    printf("res[%d] = %d\n", i, res[i]);
  }

  return printf("[RES] = %d\n", r);
}

