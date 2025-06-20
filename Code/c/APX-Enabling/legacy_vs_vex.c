
void micro () {
  asm  volatile (
     "addps %%xmm1, %%xmm2          \n\t"
     "vaddps %%xmm1, %%xmm2, %%xmm2 \n\t"
     "vaddps %%xmm25, %%xmm2, %%xmm2 \n\t"
     ::: "%xmm1" , "%xmm2" 
  );
}
