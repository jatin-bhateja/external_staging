

//typedef float __attribute__((ext_vector_type(16))) float16;
//typedef float __attribute__((ext_vector_type(8))) float8;

//
//  if (b < 0)
//    swap(a, b);  ->  tmp = b < 0 ? a : b;
//                     a  =  b < 0 ? b : a;
//                     b  = tmp;


int vector_max_avx512() {
   int mem[4] = {10,10,10,10};
   int *val = mem;
   int ret;
  __asm__ volatile(
     "mov       %1        , %%rax             \n\t"
     "movdqu    8(%%rax)     , %%xmm1            \n\t"
     "vmovdqu64   8(%%rax)     , %%zmm1            \n\t"
     "vmovd     %%xmm1 , %0                \n\t"
    : "=r"(ret)
    : "m"(val)
    : "%rax" , "%xmm1"

  );
  return ret;
}

#if 0
float16 vector_max_avx512(float16 a , float16 b) {
  float16 res = {
                  0.0f,0.0f,0.0f,0.0f,
                  0.0f,0.0f,0.0f,0.0f,
                  0.0f,0.0f,0.0f,0.0f,
                  0.0f,0.0f,0.0f,0.0f,
                };
   float16 tmp;
   float16 mask;
   int mem = 10;
   int *val = &mem;
  __asm__ volatile(
     "movdqu    %5     , %%xmm1            \n\t"
     "vmovdqu   %5     , %%xmm1            \n\t"
     "vxorps    %%zmm1 , %%zmm1 , %%zmm1   \n\t"
     "vcmpltps  %%zmm1 ,   %2   , %%k1     \n\t"
     "vmovaps   %2     ,   %3              \n\t"
     "vmovaps   %1     ,   %3 {{%%k1}}      \n\t"
     "vmovaps   %2     ,   %1 {{%%k2}}      \n\t"
     "vmovaps   %3     ,   %2              \n\t"
     "vmaxps    %2     ,   %1   , %3       \n\t"
     "vcmpunordps %1   ,   %1   , %%k1     \n\t"
     "vmovaps   %3     ,   %0              \n\t"
     "vmovaps   %1     ,   %0 {{%k1}}       \n\t"
    : "=v"(res)
    : "v"(a) , "v"(b) , "v"(tmp) , "v"(mask) , "m"(*val)
    : "%zmm1" , "%zmm2" ,"%xmm1"

  );
  return res;
}
#endif

//
//  if (b < 0)
//    swap(a, b);  ->  tmp = b < 0 ? a : b;
//                     a  =  b < 0 ? b : a;
//                     b  = tmp;

#if 0
float8 vector_max_avx(float8 a , float8 b) {
  float8 res = {
                  0.0,0.0,0.0,0.0,
                  0.0,0.0,0.0,0.0,
                };
  __asm__ volatile(
     "vblendvps  %2 , %1 , %2 , %3    \n\t"
     "vblendvps  %2 , %2 , %1 , %1    \n\t"
     "vmovaps    %3 , %2              \n\t"
     "vmaxps     %2 , %1 , %3         \n\t"
     "vcmpunordps %1 , %1 , %4        \n\t"
     "vblendvps  %4  , %1 , %3 , %0   \n\t"
    : "=v"(res)
    : "v"(a) , "v"(b) , "v"(tmp) , "v"(mask) 
    : 

  );
  return res;
}

#endif 


