#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>

float micro(float* arr, int length) {
   float res = 0.0f;
   for (int i = 0; i < length; i += 16) {
     __m512 val = _mm512_loadu_ps(arr + i); 
     res += _mm512_reduce_add_ps(val);
   }
   return res;
}


int main(int argc, char* argv[]) {
   if (argc != 2) {
     fprintf(stderr, "Incorrect Arguments! <app> <size>\n"); 
     return -1;
   }
   float res = 0.0f;
   int size = atoi(argv[1]); 
   float* arr = (float*)malloc(sizeof(float) * size);
   memset(arr, -1, sizeof(float) * size);
   for (int i = 0; i < 1000000; i++) {
     res += micro(arr, size);
   }
   auto t1 = std::chrono::high_resolution_clock::now();
   for (int i = 0; i < 1000000; i++) {
     res += micro(arr, size);
   }
   auto t2 = std::chrono::high_resolution_clock::now();
   std::chrono::duration<double> diff = t2 - t1;
   return printf("[time] %lf [res] %f\n", diff.count(), res);
}
