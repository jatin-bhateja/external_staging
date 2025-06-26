
int main(int argc, char* argv[]) {
  asm volatile(
     "movq $30, %%rax \n\t"
     "movq $40, %%rbx \n\t"
     "movq $50, %%rcx \n\t"
     "movq $60, %%rdx \n\t"
     "movq $70, %%r13 \n\t"
     "movq $80, %%r14 \n\t"
     "movq $90, %%r15 \n\t"
     "pusha           \n\t"
   : : : "%rax", "%rbx", "%rcx", "%r13", "%r14", "%r15"
  );
  return 0;
}
