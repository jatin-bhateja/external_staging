#include <immintrin.h>
#include <assert.h>
#include <stdio.h>
#include <chrono>

/*
   Algorithm:-

       M1                    M2
     AAAAAAAAAAAAAAAA     1111111111111111
     BBBBBBBBBBBBBBBB     2222222222222222
     CCCCCCCCCCCCCCCC  X  3333333333333333
     DDDDDDDDDDDDDDDD     4444444444444444
     .....                .....
     JJJJJJJJJJJJJJJJ     16161616161616161616161616161616

     Computation:
       PROD = M1 x M2
         -- where M1 and M2 are dimensionally compatible. M1 := XxY and M2 := YxZ => PROD := XxZ

     Premise:
         -- M1[][X] M2[X][] => COLS of M1 == ROWS of M2
         -- ROWS % VEC_LEN == 0 and COLS % VEC_LEN == 0

     VEC_LEN = 4
     ROWS = 16
     COLS = 16

     DIM2 = ROWS > COLS ? ROWS : COLS
     for (i = 0; i < ROWS; i++) {
       for (j = 0; j < DIM2; j+=VEC_LEN) {
         RES = VPXOR VEC VEC
         for (k = 0; k < COLS; k++) {
           VECA = BCAST M1[i][k]
           VECB = M2[k][j:j+VEC_LEN]
           RES = VECA * VECB + RES <=> RES = FMA VECA, VECB, RES
         }
         PROD[i][j:j+VEC_LEN] = RES
       }
     }
*/

#define VEC_LEN 16
#define M512(x) ((__m512)x)
#define M512I(x) ((__m512i)x)
#define M128(x) ((__m128)x)
#define M128I(x) ((__m128i)x)
#define ADDR_OF(mat,i,j,rows,cols) (mat + i*cols + j)

extern "C"
void matmul_512_ps(float* prod, float* src1, float* src2, int rows, int cols) {
  assert(cols % 16 == 0);
  assert(rows % 16 == 0);
  int dim2 = rows > cols ? cols : rows;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < dim2; j+=VEC_LEN) {
      __m512 res = _mm512_setzero();
      for (int k = 0; k < cols; k++) {
        __m128i sa = _mm_loadu_si32(ADDR_OF(src1,i,k,rows,cols));
        __m512  va = _mm512_broadcastss_ps(M128(sa));
        __m512i vb = _mm512_loadu_epi32(ADDR_OF(src2,k,j,cols,rows));
        res = _mm512_fmadd_ps(M512(va), M512(vb), M512(res));
      }
      _mm512_storeu_epi32(ADDR_OF(prod,i,j,rows,rows), M512I(res));
    }
  }
}


#ifdef _APP_MODE
void print_matrix(const char* msg, float* mat, int col, int row) {
#ifdef _DEBUG
  printf("%s\n", msg);
  printf("[\n");
  for (int i = 0; i < row; i++) {
    printf(" [ ");
    for (int j = 0; j < col; j++) {
      printf("%f, ", *ADDR_OF(mat,i,j,row,col));
    }
    printf(" ] \n");
  }
  printf("]\n");
#endif
}

float* allocate_matrix(int rows, int cols) {
  float *mat = (float*)malloc(sizeof(float)*rows*cols);
  float ctr = 0.0f;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
       *ADDR_OF(mat,i,j,rows,cols) = ctr++;
    } 
  }
  return mat;
}

int main(int argc, char* argv[]) {
  if (argc != 3) {
    return fprintf(stderr, "matmul <rows> <cols>\n");
  }
  int ROWS = atoi(argv[1]);
  int COLS = atoi(argv[2]);
  float *a = allocate_matrix(ROWS, COLS);
  float *b = allocate_matrix(COLS, ROWS);
  float *c = allocate_matrix(ROWS, ROWS);

  auto start = std::chrono::high_resolution_clock::now();
  matmul_512_ps(c, a, b, ROWS, COLS);
  auto end = std::chrono::high_resolution_clock::now();
  auto diff = std::chrono::duration<double>(end - start);

  print_matrix("a = ", a, ROWS, COLS); 
  print_matrix("b = ", b, COLS, ROWS); 
  print_matrix("c = ", c, ROWS, COLS); 
  printf("[TIME] %lfs\n", diff.count());
  return 0;
}
#endif
