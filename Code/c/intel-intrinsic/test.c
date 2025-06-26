
#include <immintrin.h>

int main() {
  int src[] = {1,2,3,4,5,6,7,8};
  int dst[8];
  __m256i vec = _mm256_loadu_epi32(src);
  __mmask16 mask = _mm512_int2mask(-1);
  vec = _mm256_mask_compress_epi16(vec, mask, vec);
  _mm256_storeu_epi32(dst, vec); 
  return 0;
}
