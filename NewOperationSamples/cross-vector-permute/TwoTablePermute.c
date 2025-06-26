
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <chrono>
#include <assert.h>

// AVX512DQ

// OOB checking cost, indices in vector so could be -ve, shuffle guarantees valid indices are in non-negative range,
// , compare against both lower bound and upper bound.
// VPCMPGT >= 0 &&  VPCMPGT < VLEN 
void algo1(int* res, int* permm, int* arr1, int* arr2, int idx) {
   asm volatile(
       "vmovdqu %1, %%ymm1  \n\t"
       "vmovdqu %2, %%ymm2  \n\t"
       "vmovdqu %3, %%ymm3  \n\t"
       "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
       "vmovdqu64 %%ymm3, %0  \n\t"
     : "=m"(res[idx])
     : "m"(arr1[idx]), "m"(arr2[idx]), "m"(permm[idx])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4"
   );
}

// VPCMPGT >= 0 && VPCMPGT < VLEN
// toShuffle() + laneIsValid() + Wrapping cost() 
void algo2(int* res, int* permm_wrapped, int mask, int* arr1, int* arr2, int idx) {
   asm volatile(
         "vmovdqu %1, %%ymm1  \n\t"
         "vmovdqu %2, %%ymm2  \n\t"
         "vmovdqu %4, %%ymm3  \n\t"
         "kmovw %3 , %%k1     \n\t"
         "vpermd %%ymm1, %%ymm3, %%ymm1 \n\t"
         "vpermd %%ymm2, %%ymm3, %%ymm2 \n\t" 
         "vpblendmd %%ymm1, %%ymm2, %%ymm3 %{%%k1} \n\t"
         "vmovdqu64 %%ymm3, %0  \n\t"
       : "=m"(res[idx])
       : "m"(arr1[idx]), "m"(arr2[idx]), "r"(mask), "m"(permm_wrapped[idx])
       : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%k1"
    );
}

// VPCMPGT >= 0 &&  VPCMPGT < VLEN 
// toShuffle() + laneIsValid() + Wrapping cost() 
void algo3(int* res, int* permm_wrapped, int mask, int* arr1, int* arr2, int idx) {
    asm volatile(
         "vmovdqu %1, %%ymm1  \n\t"
         "vmovdqu %2, %%ymm2  \n\t"
         "vmovdqu %4, %%ymm3  \n\t"
         "kmovw %3 , %%k1       \n\t"
         "knotw %%k1, %%k1      \n\t"
         "vpmovm2d %%k1, %%ymm4 \n\t"
         "vpsrld $31, %%ymm4, %%ymm4   \n\t"
         "vpslld $3, %%ymm4, %%ymm4    \n\t"
         "vpord %%ymm4, %%ymm3, %%ymm3 \n\t"
         "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
         "vmovdqu64 %%ymm3, %0  \n\t"
       : "=m"(res[idx])
       : "m"(arr1[idx]), "m"(arr2[idx]), "r"(mask), "m"(permm_wrapped[idx])
       : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%k1"
    );
}

// VPCMPGT >= 0 &&  VPCMPGT < VLEN 
// toShuffle() + laneIsValid() + Wrapping cost() 
void algo4(int* res, int* permm_wrapped, int mask, int* arr1, int* arr2, int idx) {
    asm volatile(
         "vmovdqu %1, %%ymm1  \n\t"
         "vmovdqu %2, %%ymm2  \n\t"
         "vmovdqu %4, %%ymm3  \n\t"
         "kmovw %3 , %%k1     \n\t"
         "movl $8, %%eax      \n\t"
         "vpbroadcastd %%eax, %%ymm4    \n\t"
         "vpaddd %%ymm4, %%ymm3, %%ymm4 \n\t"
         "vpblendmd %%ymm3, %%ymm4, %%ymm3 %{%%k1} \n\t"
         "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
         "vmovdqu64 %%ymm3, %0  \n\t"
       : "=m"(res[idx])
       : "m"(arr1[idx]), "m"(arr2[idx]), "r"(mask), "m"(permm_wrapped[idx])
       : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%k1", "%eax"
    );
}

void print_slice(int* res, int length) {
   for (int i = 0; i < length; i++) {
      printf("%d ", res[i]);
   }
   printf("\n");
}

int main(int argc, char* argv[]) {
  if (argc != 3 ) {
    fprintf(stderr, "Incorrect Argument.\n\t <app> <algo> <size>\n");
    return -1;
  }

  int algo = atoi(argv[1]);
  int size = atoi(argv[2]);
  assert(((size & 0x7) == 0) && "Must be multiple of 8");

  int arr1_slice[]  = {1,2,3,4,5,6,7,8};
  int arr2_slice[]  = {17,18,19,20,21,22,23,24};
  int permm_slice[] = {2,11,6,7,9,11,3,4};
  int permm_wrapped_slice[] = {2,3,6,7,1,3,3,4};

  // laneIsValid mask
  int mask = 0xCD;

  int res[size];
  int arr1[size];
  int arr2[size];
  int permm[size];
  int permm_wrapped[size];
  
  for (int i = 0; i < size; i += 8) {
     memcpy(arr1 + i, arr1_slice, sizeof(int) * 8);  
     memcpy(arr2 + i, arr2_slice, sizeof(int) * 8);  
     memcpy(permm + i, permm_slice, sizeof(int) * 8);  
     memcpy(permm_wrapped + i, permm_wrapped_slice, sizeof(int) * 8);  
  }

  #define WITERS 9000000
  #define MITERS 9000000
 
  if (algo == 0 || algo == -1) {
    for (int i = 0; i < WITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo1(res, permm, arr1, arr2, idx);
      }
    }
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < MITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo1(res, permm, arr1, arr2, idx);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    printf("[algo1 time] %lf  [res]  " , diff.count());
    print_slice(res, 8);
  }

  if (algo == 1 || algo == -1) {
    for (int i = 0; i < WITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo2(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < MITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo2(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    printf("[algo2 time] %lf  [res]  " , diff.count());
    print_slice(res, 8);
  }

  if (algo == 2 || algo == -1) {
    for (int i = 0; i < WITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo3(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < MITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
        algo3(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    printf("[algo3 time] %lf  [res]  " , diff.count());
    print_slice(res, 8);
  }

  if (algo == 3 || algo == -1) {
    for (int i = 0; i < WITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
         algo4(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < MITERS; i++) {
      for (int idx = 0; idx < size; idx += 8) {
         algo4(res, permm_wrapped, mask, arr1, arr2, idx);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    printf("[algo4 time] %lf  [res] " , diff.count());
    print_slice(res, 8);
  }

  return 0;
}

