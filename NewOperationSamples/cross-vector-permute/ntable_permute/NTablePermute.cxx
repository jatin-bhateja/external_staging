
#include <immintrin.h>
#include <iostream>

template <typename Tp>
static void printArray(const char* str, Tp* arr, int length) {
  std::cout << str << " ";
  for (int i = 0; i < length; i++) {
     std::cout << arr[i] << ",";
  }
  std::cout << std::endl;
}
static int flag = 0;

#ifdef __cplusplus
extern "C"
#endif
// Operates over non-heap allocation.
void permute2Tables(float* res, float* src1, float* src2, int* indexes) {
   __m512 vsrc1 = _mm512_loadu_ps((const void*)src1); 
   __m512 vsrc2 = _mm512_loadu_ps((const void*)src2); 
   __m512i vindex = _mm512_loadu_epi32((const void*)indexes);
   __m512 vres = _mm512_permutex2var_ps(vsrc1, vindex, vsrc2);
   _mm512_storeu_ps(res, vres);
#ifdef DEBUG
   if (flag == 0) {
     printArray("[c-src1] ", src1, 16);
     printArray("[c-src2] ", src2, 16);
     printArray("[c-indexes]" , indexes, 16);
     printArray("[c-res]", res, 16);
     flag = 1;
   }
#endif
}
