
#include <immintrin.h>
#include <stdio.h>

void printVec(__m256i vec, int len) {
  printf("\n");
  for(int i = 0 ; i < len ;i++)
    printf("%d " , vec[i]);
  printf("\n");
}

#define VL 8

int shiftEL(int j) {
        __m256i res;
        // AT&T
        asm volatile(
                        "vpbroadcastd %1 , %0 \n\t"
                        : "=v"(res)
                        : "m"(j)
                    );
        printVec(res,8);
        return res[2];
}

int main() {
        int init = 4;
        return shiftEL(init);
}

