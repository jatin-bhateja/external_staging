
void micro(int dst, int src1, int src2) {
   asm volatile(
     "addl %%r15d, %%r16d, %%r17d \n\t"
    :
    :
    : "%r15", "%r16", "%r17"
   );
}
