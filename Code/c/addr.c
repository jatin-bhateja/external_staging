

void func() {
  asm volatile(
    "leaq 0x10(%%rip), %%r9 \n\t"
    "leaq 0x10(%%rip), %%rbx \n\t"
    "leaq 0x10(%%rbx), %%rax \n\t"
  :
  :
  : "%rax", "%rbx");
}
