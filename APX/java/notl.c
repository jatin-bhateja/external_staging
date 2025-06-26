
void micro() {
   asm volatile ("notq 0x10(%%rax, %%rbx), %%r17 \n\t" : : : "cc", "%r17");
}
