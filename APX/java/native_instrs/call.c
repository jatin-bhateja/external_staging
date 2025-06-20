void func() {
   asm volatile (
      "call *%%r17 \n\t"
      "call *%%rax \n\t"
     : : : "%r17" , "%rax"
   );
}
