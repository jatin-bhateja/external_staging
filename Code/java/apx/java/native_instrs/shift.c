

void func() {
  asm volatile (
     "shlxq %%r21, %%r22, %%r23 \n\t"
     "vpxord %%zmm17, %%zmm17, %%zmm17 \n\t"
   : : : "%r21", "%r22", "%r23", "%zmm17"
  );
}
