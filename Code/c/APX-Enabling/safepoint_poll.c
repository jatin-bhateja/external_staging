

void micro() {
   asm volatile (
      "testl %%eax, (%%rax) \n\t"
      "testl %%eax, (%%r15) \n\t"
      "testl %%eax, (%%r16) \n\t"
    : : : "%eax", "%r15", "%r16"
   );
}
