#include <stdio.h>
void print() {
   printf("Print MSG\n");
}

void micro() {
    long r1 = 30, r2 = 20, r3, r4;
    asm volatile (
      "movq %2, %%r17     \n\t"
      "movq %3, %%r19     \n\t"
      "movq %%rsp, %%r15  \n\t"
      "andq $15 , %%rsp   \n\t"
      "movq %%r15, %%rsp  \n\t"
      "jnz move_seq1      \n\t"  
      "push2 %%r16, %%r17 \n\t"
      "push2 %%r18, %%r19 \n\t"
      "push2 %%r20, %%r21 \n\t"
      "push2 %%r22, %%r23 \n\t"
      "push2 %%r24, %%r25 \n\t"
      "push2 %%r26, %%r27 \n\t"
      "push2 %%r28, %%r29 \n\t"
      "push2 %%r30, %%r31 \n\t"
      "jmp call_leaf     \n\t"
      "move_seq1:        \n\t"
      "subq $128, %%rsp   \n\t"
      "movq %%r16, 0x80(%%rsp) \n\t"
      "movq %%r17, 0x78(%%rsp)  \n\t"
      "movq %%r18, 0x70(%%rsp) \n\t"
      "movq %%r19, 0x68(%%rsp)  \n\t"
      "movq %%r20, 0x60(%%rsp) \n\t"
      "movq %%r21, 0x58(%%rsp)  \n\t"
      "movq %%r22, 0x50(%%rsp) \n\t"
      "movq %%r23, 0x48(%%rsp)  \n\t"
      "movq %%r24, 0x40(%%rsp) \n\t"
      "movq %%r25, 0x38(%%rsp)  \n\t"
      "movq %%r26, 0x30(%%rsp) \n\t"
      "movq %%r27, 0x28(%%rsp)  \n\t"
      "movq %%r28, 0x20(%%rsp) \n\t"
      "movq %%r29, 0x18(%%rsp)  \n\t"
      "movq %%r30, 0x10(%%rsp) \n\t"
      "movq %%r31, 0x8(%%rsp)  \n\t"
      "call_leaf:       \n\t"
      "call print       \n\t"
      "movq %%rsp, %%r15 \n\t"
      "andq $15, %%rsp  \n\t"
      "movq %%r15, %%rsp \n\t"
      "jnz move_seq2    \n\t"
      "pop2 %%r31, %%r30 \n\t"
      "pop2 %%r29, %%r28 \n\t"
      "pop2 %%r27, %%r26 \n\t"
      "pop2 %%r25, %%r24 \n\t"
      "pop2 %%r23, %%r22 \n\t"
      "pop2 %%r21, %%r20 \n\t"
      "pop2 %%r19, %%r18 \n\t"
      "pop2 %%r17, %%r16 \n\t"
      "jmp done         \n\t"
      "move_seq2:       \n\t"
      "movq 0x80(%%rsp), %%r16 \n\t"
      "movq 0x78(%%rsp), %%r17  \n\t"
      "movq 0x70(%%rsp), %%r18 \n\t"
      "movq 0x68(%%rsp), %%r19  \n\t"
      "movq 0x60(%%rsp), %%r20 \n\t"
      "movq 0x58(%%rsp), %%r21  \n\t"
      "movq 0x50(%%rsp), %%r22 \n\t"
      "movq 0x48(%%rsp), %%r23  \n\t"
      "movq 0x40(%%rsp), %%r24 \n\t"
      "movq 0x38(%%rsp), %%r25  \n\t"
      "movq 0x30(%%rsp), %%r26 \n\t"
      "movq 0x28(%%rsp), %%r27  \n\t"
      "movq 0x20(%%rsp), %%r28 \n\t"
      "movq 0x18(%%rsp), %%r29  \n\t"
      "movq 0x10(%%rsp), %%r30  \n\t"
      "movq 0x8(%%rsp), %%r31 \n\t"
      "done:             \n\t"
      "  movq %%r17, %0  \n\t"
      "  movq %%r19, %1  \n\t"
     : "=r"(r3), "=r"(r4)
     : "r"(r1), "r"(r2)
     : "%r17", "%r19", "cc"
    );
    printf("r3 = %ld, r4 = %ld\n", r3, r4);
}

int main() {
   micro();
}
