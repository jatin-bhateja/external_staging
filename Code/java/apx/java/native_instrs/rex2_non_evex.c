

void func() {
  asm volatile (
     "addq %%r20, %%r23 \n\t"
     "shlxq %%r20, %%r23, %%r23 \n\t"
     "vpternlogd $0xff, %%zmm1, %%zmm2, %%zmm3 \n\t"
   : : : "%r20", "%r23", "%zmm1" ,"%zmm2", "%zmm3"
  );
}

int main() {
  func();
  return 0;
}
