
#include <immintrin.h>
#include <stdio.h>
template <typename VecT>
void printVec(VecT vec, int len) {
  printf("\n");
  for(int i = 0 ; i < len ;i++)
    printf("%d " , vec[i]);
  printf("\n");
}

void printVec(int *vec, int len) {
  printf("\n");
  for(int i = 0 ; i < len ;i++)
    printf("%d " , vec[i]);
  printf("\n");
}

#define VL 8

int shiftEL() {

 int res[8];
 __m256i ones_vec = _mm256_set1_epi32(2);
 printVec<__m256i>(ones_vec, 8);
 
/*
 int * mem = (int*)_mm_malloc(sizeof(int)*VL,32);
 for (int i = 0 ; i < VL ; i++)
   mem[i] = 10 * (i+1);
 __m256i mem_vec = _mm256_maskload_epi32(mem, ones_vec);

 int mask[] = {0,0,1,1,1,1,1,1};
 __m256i mask_vec = _mm256_maskload_epi32(mask, ones_vec);

 int shuf_idx[] = {0,0,0,1,2,3,4,5};
 __m256i shuf_idx_vec = _mm256_maskload_epi32(shuf_idx, ones_vec);

 __m256i pr1 = _mm256_permutevar8x32_epi32(mem_vec, shuf_idx_vec);
 __m256i res_vec = _mm256_mask_and_epi32(ones_vec,255, pr1,mask_vec);  

 _mm256_maskstore_epi32(res, ones_vec, res_vec);

 printVec(res,8); 
 return res[2];
*/
 return ones_vec[0];
}

int main() {
  return shiftEL();
} 
