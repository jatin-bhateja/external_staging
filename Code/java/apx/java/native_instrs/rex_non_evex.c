

void func() {
  asm volatile (
     "addq %%r15, %%r14 \n\t"
     "shlxq %%r15, %%r14, %%r15 \n\t"
     "vpternlogd $0xff, %%zmm1, %%zmm2, %%zmm3 \n\t"
   : : : "%r15", "%r14", "%zmm1" ,"%zmm2", "%zmm3"
  );
}

int main() {
  func();
  return 0;
}
