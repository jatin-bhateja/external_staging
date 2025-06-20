
void micro() {
  asm volatile(
     "cvtsi2ssl %%r17d, %%xmm0 \n\t"
   : : : "%xmm0" , "%r17"
  );
}
