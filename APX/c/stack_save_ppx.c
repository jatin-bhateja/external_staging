
#include <stdio.h>
#include <assert.h>

void micro() {
    long result = 0;
    asm volatile (
      "movq $0 , %%rax  \n\t"
      "movq $1,  %%rcx  \n\t"
      "movq $2,  %%rdx  \n\t"
      "movq $3,  %%rdi  \n\t"
      "movq $4,  %%rsi  \n\t"
      "movq $5,  %%r8   \n\t"
      "movq $6,  %%r9   \n\t"
      "movq $7,  %%r10  \n\t"
      "movq $8,  %%r11  \n\t"
      // Data being pushed by PUSH2 must be 16B-aligned on the stack, for this push rax upfront
      // and use it as a temporary register for stack alignment.
      "pushq %%rax       \n\t"
      // Move original stack pointer to RAX and align stack pointer to 16B boundary.
      "movq %%rsp, %%rax \n\t"
      "andq $-16 , %%rsp \n\t"
      // Push original stack pointer along with remaining registers on 16B aligned stack.
      // Note: For PPX to work properly, a PPX-marked PUSH2 (respectively, POP2) should always
      // be matched with a PPX-marked POP2 (PUSH2), not with two PPX-marked POPs (PUSHs).
      "pushq  %%rax        \n\t"
      "pushp  %%rcx        \n\t"
      "push2p %%rdi, %%rdx \n\t"
      "push2p %%r8, %%rsi  \n\t"
      "push2p %%r10, %%r9  \n\t"
      // To maintain 16 byte alignment after r11 is pushed.
      "subq $8,  %%rsp     \n\t"
      "pushp %%r11         \n\t"
      // Re-set the GPRs
      "movq $-1 , %%rax  \n\t"
      "movq $-1,  %%rcx  \n\t"
      "movq $-1,  %%rdx  \n\t"
      "movq $-1,  %%rdi  \n\t"
      "movq $-1,  %%rsi  \n\t"
      "movq $-1,  %%r8   \n\t"
      "movq $-1,  %%r9   \n\t"
      "movq $-1,  %%r10  \n\t"
      "movq $-1,  %%r11  \n\t"
      // Restore stack.
      "popp   %%r11        \n\t"
      "addq   $8, %%rsp    \n\t"
      // Data being popped by pop2 must be 16B-aligned on the stack.
      "pop2p  %%r9,  %%r10 \n\t"
      "pop2p  %%rsi, %%r8  \n\t"
      "pop2p  %%rdx, %%rdi \n\t"
      "popp   %%rcx        \n\t"
      // Re-instantiate original stack pointer.
      "movq 0x0(%%rsp),  %%rsp \n\t"
      "popq %%rax           \n\t"
      //  Case 2 __ addptr(rsp, wordSize);
      //  Case 3 __ movptr(_result, rax);
      //          __ pop(rax);
      "cmpq $0 , %%rax    \n\t"
      "jne error          \n\t"
      "cmpq $1 , %%rcx    \n\t"
      "jne error          \n\t"
      "cmpq $2 , %%rdx    \n\t"
      "jne error          \n\t"
      "cmpq $3 , %%rdi    \n\t"
      "jne error          \n\t"
      "cmpq $4 , %%rsi    \n\t"
      "jne error          \n\t"
      "cmpq $5 , %%r8     \n\t"
      "jne error          \n\t"
      "cmpq $6 , %%r9     \n\t"
      "jne error          \n\t"
      "cmpq $7 , %%r10    \n\t"
      "jne error          \n\t"
      "cmpq $8 , %%r11    \n\t"
      "jne error          \n\t"
      "noerror:           \n\t"
      "movq $1,    %0     \n\t"
      "jmp done           \n\t"
      "error:             \n\t"
      "movq $-1,    %0    \n\t"
      "done:              \n\t"
      :  "=r"(result)
      :
      : "cc", "%rax", "%rcx", "%rdx", "%rdi", "%rsi", "%r8", "%r9", "%r10", "%r11"
    );
    assert(result == 1 && "incorrect result");
}

int main () {
  micro();
  return 0;
}
