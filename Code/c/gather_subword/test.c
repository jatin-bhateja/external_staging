int main() {
  asm volatile(
    "bt %%rdi , %%r10 \t"
   :
   :
   : "%rdi", "%r10"
  );
  return 0;
}
