
int micro() {
   asm volatile (
     "lea 0x10(%%rsp), %%rax \n\t"
     "lea 0x110(%%rsp), %%rax \n\t"
     "lea 0x10(%%rsp), %%r17 \n\t"
     "lea 0x110(%%rsp), %%r17 \n\t"
    : : : "%rbx", "%r17", "%r15"
   );
}
