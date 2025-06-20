
__attribute__((noinline))
int func() {
  int val;
  asm volatile (
     "mov  $15    , %%eax   \n\t"
     "kmovd %%eax , %%k1    \n\t"
     "vpbroadcastb %%eax , %%zmm1 \n\t"
     "movl %%eax  , %0      \n\t"
    : "=r"(val)
    :
    : "%eax" , "%xmm0" , "%zmm1" , "%k1"
  );
  return val;
}

int main() {
  return func();
}

