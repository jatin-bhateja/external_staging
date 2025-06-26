

void micro1() {
  asm volatile (
    "vpaddd %%zmm2, %%zmm1, %%zmm0 \n\t"
    : : : "%zmm0" , "%zmm1", "%zmm2" 
  );
}
