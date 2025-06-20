
#include "assert.h"
#include "stdio.h"
#include "immintrin.h"
#include "math.h"

void round_off(double *mem, int mode) {
   __m256d arg = _mm256_load_pd(mem);
   __m256d res;
   switch(mode) {
     default:
        assert(0);
     case 0 : res = _mm256_round_pd(arg, 0);
        break;
     case 1 : res = _mm256_round_pd(arg, 1);
        break;
     case 2 : res = _mm256_round_pd(arg, 2);
        break;
     case 3 : res = _mm256_round_pd(arg, 3);
        break;
     case 4 : res = _mm256_round_pd(arg, 4);
        break;
    }
   _mm256_store_pd(mem, res);
}

void round_ceil(double *mem) {
   __m256d arg = _mm256_load_pd(mem);
   __m256d res = _mm256_ceil_pd(arg);
   _mm256_store_pd(mem, res);
}

void round_floor(double *mem) {
   __m256d arg = _mm256_load_pd(mem);
   __m256d res = _mm256_floor_pd(arg);
   _mm256_store_pd(mem, res);
}

int printmem(double * mem, int len) {
  int cnt = 0;
  for(int i = 0 ; i < len ; i++, cnt++) 
    fprintf(stdout,"%lf ", mem[i]);
  fprintf(stdout,"\n");
  return cnt;
}

void initmem(double * mem) {
  for(int i = 0 ; i < 4; i++)
     //mem[i] = i + -1.1;
     mem[i] = -NAN;
}

int main() {
  int ret = 0;
  double mem[4];
  initmem(mem);
  round_floor(mem);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_ceil(mem);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_off(mem,0);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_off(mem,1);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_off(mem,2);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_off(mem,3);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  initmem(mem);
  round_off(mem,4);
  ret += printmem(mem, sizeof(mem)/sizeof(double));
  return ret;
}
