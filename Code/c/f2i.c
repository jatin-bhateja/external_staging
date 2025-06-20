

int main() {
   float f = -7500.0f;
   int res = 0;
   asm volatile (
      "cvttss2si %1, %%eax \n\t"
      "movl %%eax, %0       \n\t"
    : "=r"(res)
    : "x"(f)
    : "%eax"
   );
   return res;
}
