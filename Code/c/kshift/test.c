

__attribute__((noinline))
long genMask(int length) {
  long mask = 0;
  asm volatile(
      "kxnorq  %%k1 , %%k1 , %%k1 \n\t"
      "m
    :
    :
    :
  );
  
}
