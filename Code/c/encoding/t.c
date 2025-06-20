

float doSumZ1(float f1, float f2) {
  float res = 0.0f;
  asm volatile(
    "vmovups %1 , %%zmm1 \n\t"
    "vmovups %2 , %%zmm2 \n\t"
    "vaddps  %%zmm1 , %%zmm2 , %%zmm0 \n\t"
    "vmovups %%zmm0 , %0 \n\t"
   : "=m"(res)
   : "m"(f1) , "m"(f2)
   : "%zmm0" , "%zmm1" , "%zmm2"
  );
  return res; 
}

float doSumZ2(float f1, float f2) {
  float res = 0.0f;
  asm volatile(
    "vmovups %1 , %%zmm1 \n\t"
    "vmovups %2 , %%zmm2 \n\t"
    "vaddps  %%zmm1 , %%zmm2 , %%zmm0{{%%k1}} \n\t"
    "vmovups %%zmm0 , %0 \n\t"
   : "=m"(res)
   : "m"(f1) , "m"(f2)
   : "%zmm0" , "%zmm1" , "%zmm2"
  );
  return res; 
}

float doSumY(float f1, float f2) {
  float res = 0.0f;
  asm volatile(
    "vmovups %1 , %%ymm1 \n\t"
    "vmovups %2 , %%ymm2 \n\t"
    "vaddps  %%ymm1 , %%ymm2 , %%ymm0 \n\t"
    "vmovups %%ymm0 , %0 \n\t"
   : "=m"(res)
   : "m"(f1) , "m"(f2)
   : "%ymm0" , "%ymm1", "%ymm2"
  );
  return res; 
}

float doSumX(float f1, float f2) {
  float res = 0.0f;
  asm volatile(
    "vmovups %1 , %%xmm1 \n\t"
    "vmovups %2 , %%xmm2 \n\t"
    "vaddps  %%xmm1 , %%xmm2 , %%xmm0 \n\t"
    "vmovups %%xmm0 , %0 \n\t"
   : "=m"(res)
   : "m"(f1) , "m"(f2)
   : "%xmm0" , "%xmm1", "%xmm2"
  );
  return res; 
}
