int main() {
  int out = 0;
  asm volatile (
      "movl $1, %%eax \n\t"
      "nop [rax+rax*1+0x1f4], eax      \n\t"
      "movl %%eax, %0 \n\t"
    : "=r"(out)
    :
    : "%eax", "%ebx"
  );
  return out;
}
