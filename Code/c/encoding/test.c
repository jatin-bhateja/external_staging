void micro() {
  asm volatile (
     "vpermd 0x400(%%rsi), %%zmm2, %%zmm1 \n\t" 
     "vpermd 0x400(%%rsi), %%ymm2, %%ymm1 \n\t" 
   : : : "%rsi" , "%zmm2", "%zmm1"
  );
}
