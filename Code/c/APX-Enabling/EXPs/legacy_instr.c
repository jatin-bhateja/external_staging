

long micro() {
  long dst;
  asm volatile ("imulq %%r16, %%r10 \n\t"
                 : "+r"(dst)
                 :
                 : "%r16" , "%r10");
  return dst;
}

