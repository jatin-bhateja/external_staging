
long mem[] = {1,2,3,4};

int main() {
  asm volatile (
    "movq %0 , %%r17      \n\t"
    "prefetchw 0xc00000(%%r17) \n\t"
    : : "m"(mem[0]) : "%r17"
  );
  return 0;
}
