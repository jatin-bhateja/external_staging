void micro() {
  asm volatile (
     "vpextrd $1, %%xmm2, %%r21d \n\t"
    : : : "%xmm2", "%r21"
  );
}

int main() {
  micro();
}
