
#include<math.h>
#include<stdio.h>
#include<assert.h>
#include<chrono>

int posinf[] = {0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000};
unsigned int neginf[] = {0x80000000, 0x80000000, 0x80000000, 0x80000000, 0x80000000, 0x80000000, 0x80000000, 0x80000000};
int maxint[] = {0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF};
int maxfloat[] = {0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF, 0x7F7FFFFF};

float convF2I_avx(float * inp, int * out, int length, int idx) {
  for (int i = 0 ; i < length; i+=8) {
    asm volatile (
       "vmovdqu %1 , %%ymm0 \n\t"
       "vpxor %%ymm1, %%ymm1 , %%ymm1 \n\t"
       "vcvttps2dq %%ymm0, %%ymm2 \n\t"                // NaN/POS_INF/NEF_INF/MAX_FLOAT/MIN_FLOAT -> 0x80000000
       "vcmpps $3, %%ymm0, %%ymm0 , %%ymm3 \n\t"       // Unordered compare
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t"
       "vmovdqu %2, %%ymm1 \n\t"
       "vcmpps $0, %%ymm0, %%ymm1 , %%ymm3 \n\t"
       "vmovdqu %3, %%ymm1 \n\t"
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t"
       "vmovdqu %4, %%ymm1 \n\t"
       "vcmpps $0, %%ymm0, %%ymm1 , %%ymm3 \n\t"
       "vmovdqu %3, %%ymm1 \n\t"
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t"
       "vmovdqu %%ymm2, %0 \n\t"
     : "=m"(*(out+i))
     : "m"(*(inp+i)), "m"(posinf), "m"(maxint), "m"(maxfloat)
     : "%ymm0", "%ymm1", "%ymm2", "%ymm3" , "cc"
    );
  }
  return out[idx];
}

float convF2I_avx512(float * inp, int * out, int length, int idx) {
  for (int i = 0 ; i < length; i+=8) {
    asm volatile (
       "vmovdqu %1 , %%ymm0 \n\t"
       "vcvttps2dq %%ymm0, %%ymm2 \n\t"
       "vmovdqu %3, %%ymm3 \n\t"
       "vcmpps $0, %%ymm3, %%ymm2 , %%k1 \n\t"
       "vpxor %%ymm1, %%ymm1 , %%ymm1 \n\t"
       "vcmpps $3, %%ymm0 , %%ymm0 , %%ymm3 \n\t"
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t"
       "vfpclassps $8, %%ymm0 , %%k1 \n\t"
       "vpmovm2d %%k1, %%ymm3 \n\t" 
       "vmovdqu %2, %%ymm1 \n\t"
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t" // Select opmask variant of blend, remove vpmovm2d
       "vmovdqu %4, %%ymm1 \n\t"
       "vcmpps $0, %%ymm0, %%ymm1 , %%ymm3 \n\t"
       "vmovdqu %2, %%ymm1 \n\t"
       "vblendvps %%ymm3, %%ymm1, %%ymm2, %%ymm2 \n\t"
       "vmovdqu %%ymm2, %0 \n\t"
       "done: \n\t"
     : "=m"(*(out+i))
     : "m"(*(inp+i)), "m"(maxint), "m"(neginf), "m"(maxfloat)
     : "%ymm0", "%ymm1", "%ymm2", "%ymm3" , "%k1", "cc"
    );
  }
  return out[idx];
}

float convF2I_scalar(float * inp, int * out, int length, int idx) {
  for(int i = 0 ; i < length ; i++) {
      out[i] =  (int)inp[i];
  }
  return out[idx];
}

int main(int argc, char * argv[]) {
   if (argc < 2) {
      return fprintf(stderr, "vlen expected!\n");
   }
   int vlen = atoi(argv[1]);
   assert((vlen & (vlen - 1))  == 0);

   // Java Semantics Input
   float vals[] = {0.0,NAN,-INFINITY,INFINITY,-0.0,MAXFLOAT,-MAXFLOAT,7.7f};
   //float vals[] = {MAXFLOAT,MAXFLOAT,MAXFLOAT,MAXFLOAT,MAXFLOAT,MAXFLOAT,MAXFLOAT,MAXFLOAT};
   //float vals[] = {0.0,1.1,2.2,3.3,4.4,5.5,6.6,7.7};

   int out[vlen];  
   float inp[vlen]; 
   for (int i = 0; i < vlen; i++) {
      inp[i] = vals[i & 7];
   }

   float res = 0.0f;
   auto start = std::chrono::steady_clock::now();
   for (int i = 0; i < 1000000; i++) {
      res += convF2I_avx(inp, out, vlen, i & (vlen-1));
   }
   auto end = std::chrono::steady_clock::now();

   std::chrono::duration<double> diff = end - start;
   printf("[VectorAVX Time] %lf  [Res] %f\n" , diff.count(), res); 
   printf("\n");

   for(int i = 0 ; i < 8 ; i++) {
      printf("%f -> %d \n", inp[i], out[i]);
   }

   printf("\n");
   res = 0.0f;
   start = std::chrono::steady_clock::now();
   for (int i = 0; i < 1000000; i++) {
      res += convF2I_avx512(inp, out, vlen, i & (vlen-1));
   }
   end = std::chrono::steady_clock::now();
   diff = end - start;

   printf("[VectorAVX512 Time] %lf  [Res] %f\n" , diff.count(), res); 
   printf("\n");
   for(int i = 0 ; i < 8 ; i++) {
      printf("%f -> %d \n", inp[i], out[i]);
   }

   printf("\n");
   res = 0.0f;
   start = std::chrono::steady_clock::now();
   for (int i = 0; i < 1000000; i++) {
      res += convF2I_scalar(inp, out, vlen, i & (vlen-1));
   }
   end = std::chrono::steady_clock::now();
   diff = end - start;

   printf("[Scalar Time] %lf  [Res] %f\n" , diff.count(), res); 
   printf("\n");
   for(int i = 0 ; i < 8 ; i++) {
      printf("%f -> %d \n", inp[i], out[i]);
   }
   return 0;
}
