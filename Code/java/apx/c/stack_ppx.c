
void micro() {
   asm volatile (
      "push2p %%r17 , %%r19\n\t"
      "popp  %%r19     \n\t"
      "popp  %%r17     \n\t"
     : : : "%r17" , "%r19"
   );
}


int main() {
  micro();
}
