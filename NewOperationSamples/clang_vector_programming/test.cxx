
#include <stdio.h>
#include <stdlib.h>
#include <chrono>
#include <assert.h>
#include <string.h>
#include <stdint.h>

#define LANE_COUNT 16
#define LANE_TYPE int
#define VEC_SIZE 64
#define VEC_SIZE_M1 63

#define decl_vect_type(x,y) \
 typedef long x##y __attribute__((vector_size(y * sizeof(x))))

#define decl_vect(x,y) \
 x##y

decl_vect_type(long,8);
decl_vect_type(int,8);
decl_vect_type(int,16);

#define elem_count_to_align(ptr, type, alignment) \
  ((((reinterpret_cast<uint64_t>(ptr) + alignment) & (-alignment)) - (reinterpret_cast<uint64_t>(ptr))) / sizeof(type))
  
#define loop_bound(type, vec_size, trip_count) \
  (trip_count & (-(vec_size / sizeof(type))))

#define vec_lanes(vec_type, elem_type) \
  (sizeof(vec_type) / sizeof(elem_type))


typedef void (*kernel) (int*, int*, int*, int);

__attribute__((noinline))
void unsafe_vector_add(int* res, int* src1, int* src2, int len) {
   // Must be 4 byte aligned.
   assert((reinterpret_cast<uint64_t>(res) & 0x3L) == 0L);
   assert((reinterpret_cast<uint64_t>(src1) & 0x3L) == 0L);
   assert((reinterpret_cast<uint64_t>(src2) & 0x3L) == 0L);
   
   using vec_type = decl_vect(int, 16);

   // Pre-loop.
   // Result aligned.
   int i = 0;
   if (reinterpret_cast<uint64_t>(res) & VEC_SIZE_M1) {
     int peel_count = elem_count_to_align(res, int, VEC_SIZE);
     // Multi-version loop body using vpalignr to load source from aligned address, since palignr accepts a constant alignment
     // hence multiple versions based on peel_count and starting address of src1, but it will bloat the code, currently we see
     // vector split load penalty which less compared to store split penalty.
     while(peel_count) {
       res[i] = src1[i] + src2[i];
       peel_count--;
     }
     src1 += peel_count;
     src2 += peel_count;
     res  += peel_count;
   }
   // Aligned main vector loop;
   int loop_ub = loop_bound(int, VEC_SIZE, len);
   int vec_elem_cnt = vec_lanes(vec_type, int);
   while(i  < loop_ub) {
      // Generates VMOVDQA64, which imposes strict alignment constraint on starting address to be multiple of vector size.
      int16 vec1 = ((int16*)src1)[0];
      int16 vec2 = ((int16*)src2)[0];
      ((int16*)res)[0] = vec1 + vec2;
      src1 += vec_elem_cnt;
      src2 += vec_elem_cnt;
      res  += vec_elem_cnt;
      i += vec_elem_cnt;
   }
   // Post-loop
   for (; i < len; i++) {
      res[i] = src1[i] + src2[i];
   }
}

void unsafe_scalar_add(int* res, int* src1, int* src2, int len);

#if 0
__attribute__((optimize("no-tree-vectorize")))
void unsafe_scalar_add(int* res, int* src1, int* src2, int len) {
   for (int i = 0; i < len; i++) {
      res[i] = src1[i] + src2[i];
   }
}
#endif

/*
  Application1: 
  ============
  decl_vect(long,8) vec1 = {1,2,3,4,5,6,7,8};
  decl_vect(long,8) vec2 = {1,1,1,1,1,1,1,1};
  decl_vect(int,8) res1 = {0,0,0,0,0,0,0,0};
  decl_vect(int,8) res2 = {0,0,0,0,0,0,0,0};
  decl_vect(int,8) res3 = {0,0,0,0,0,0,0,0};
  int arr[] = {2,3,4,5,6,7,8,9};
  res2 = ((int8*)(arr))[0];
  asm volatile ("vcvtpd2ps %1, %0" : "=x"(res1) : "x"(vec1) : );
  asm volatile ("vcvtpd2ps %1, %0" : "=x"(res2) : "x"(vec2) : );
  res3 = res1 + res2;
*/

#define WARMUP 500000
#define MEASUREMENT 1000000

int main(int argc, char* argv[]) {
   if (argc != 3) {
      fprintf(stderr, "Incorrect Arguments!\n<app> <size>\n");
   }
   int size = atoi(argv[1]);
   int algo = atoi(argv[2]);

   int* src1 = (int*)malloc(sizeof(int)* size);
   int* src2 = (int*)malloc(sizeof(int)* size);
   int* res = (int*)malloc(sizeof(int)* size);
   memset(src1, 0x1, size); 
   memset(src1, 0x1, size); 
  
   kernel fn = algo == 0 ? unsafe_scalar_add : unsafe_vector_add;   
   for (int iter = 0; iter < WARMUP; iter++) {
      fn(res, src1, src2, size);
   }
   auto start = std::chrono::steady_clock::now();
   for (int iter = 0; iter < MEASUREMENT; iter++) {
      fn(res, src1, src2, size);
   }
   auto end = std::chrono::steady_clock::now();

   std::chrono::duration<double> diff = end - start;
   printf("[time] %lf  [res] %d\n" , diff.count(), res[0]);
}

