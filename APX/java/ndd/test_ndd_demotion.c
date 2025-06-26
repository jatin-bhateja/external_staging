
void micro() {
   asm volatile (
      "addq %%rax, %%rbx, %%rax \n\t"
      "addq %%rbx, %%rax, %%rax \n\t"
      "addq 0x10(%%rbx), %%rax, %%rax \n\t"
      "addq %%rax, 0x10(%%rbx), %%rax \n\t"
      "addq 0x10(%%rbx), %%rax \n\t"
      "addq %%rbx, %%rax \n\t"
     :  :  : "%rax" , "%rbx"
   );
}
