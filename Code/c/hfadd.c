


int main() { 
  float vec1 [] = {1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1};
  float vec2 [] = {2.2,2.2,2.2,2.2,2.2,2.2,2.2,2.2};
  float res[8] = {0.0};
  asm volatile (
    "vpmovdqu %1, %%ymm1 \n\t"
    "vpmovdqu %2, %%ymm2 \n\t"
    "vcvtps2ph %%ymm1, xmm1 \n\t"
    "vcvtps2ph %%ymm2, xmm2 \n\t"
    "vaddph  %%xmm1, %%xmm2 , %%xmm3 \n\t"
    "vcvtph2ps %%xmm3, %%ymm3  \n\t"
    "vpmovdqu %%ymm3 , %0 \n\t"
   : "=m"(*res)
   : "m"(*vec1), "m"(*vec2)
   : "%ymm1", "%ymm2", "%ymm2"
  );
 
  for(int i = 0 ; i < 8 ;i++) {
    printf("res[%d] = %f\n", i, res[i]);
  } 
  return 0;
}
