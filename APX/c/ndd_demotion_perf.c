
void micro() {
   asm volatile (
     "addq $1, 0x10(%%rax,), %%rcx \n\t"
     "addq $1, 0x10(%%rax)  \n\t"
     "movq 0x10(%%rax), %%rcx \n\t"
    : : : "%rcx", "%rbx", "%rax", "cc"
   );
}
