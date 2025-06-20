
// JIT code generation for Long/Integer.compare
// http://mail.openjdk.java.net/pipermail/hotspot-compiler-dev/2015-September/019112.html

// LT : PL = 3 no     br-misp
// EQ : PL = 5 with 1 br-misp
// GT : PL = 7 with 2 br-misp

int compare_current(int a, int b) {
  __asm__ volatile(
     " movq   $0 , %%rax  \n\t"
     " cmpq   %1 , %2     \n\t"
     " jl     L_less      \n\t"
     " cmpq   %1 , %2     \n\t"
     " je     L_exit      \n\t"
     " movq   $1 , %%rax  \n\t"
     " jmp    L_exit      \n\t"
     "L_less:             \n\t"
     " movq   $-1, %%rax  \n\t"
     "L_exit:             \n\t"
  );
}

// LT, EQ , GT : PL = 4 no br-misp
int compare_new(int a, int b) {
  __asm__ volatile(
    "movq $-1 , %%rax  \n\t"
    "cmpq %1  , %2     \n\t"
    "cmove $0 , %%rax  \n\t"
    "cmovg $1 , %%rax  \n\t"
  );
}

