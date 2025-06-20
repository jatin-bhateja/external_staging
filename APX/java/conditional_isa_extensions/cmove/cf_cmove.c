
#include <stdio.h>

long gsrc = 20;
long gdst = 30;

int main() {
   long cond = 10;
   long* src = &gsrc;
   long* dst = NULL;
    
   /*
From Manual: 
Specifically, CMOVcc loads data from its source operand into a temporary register unconditionally (regardless of the condition code and the status flags in the EFLAGS register). If the condition code associated with the instruction (cc) is satisfied, the data in the temporary register is then copied into the instruction's destination operand.

This can lead to memory access violation even if condition for CMov is not satisfied. Memory access violation signals are caught by OS first and then
delegated to application registered signal handler for effective disposal.

Conditionally faulting variants added with APX lifts this limitation and suppresses and 
 
  - Out of following 4 variants of CMove only NDD variant is useful for the time being, Java being a type safe languar perform explicit null pointer
    checks and using CF variants will not be of much use. Zero-upper CFCMove also has a limited use
 
  -  EVEX.NF    EVEX.ND
      0            0       - CF variant
      0            1       - CF variant + swap src / des 
      1            0       - NDD
      1            1       - CF + NDD 
 
  In contrast, the REX2 versions of CMOVcc have the same legacy behavior as the existing CMOVcc. In
particular, the destination register is not zeroed and memory faults are not suppressed when the condition
is false. This behavior keeps legacy CMOVcc operation semantics and timing in line with current
speculation/side-channel rules used for load hardening and other usages
   
    - Unlike conditional variants of CMP and TEST, this perticular ISA extension will not improve upon Branch misprediction. 
       
    - CMOVE + NDD is part of our NDD support patch.
   
    */
   asm volatile (
      "cmpq      $10, %1   \n\t"
      "cfcmovne  %0,  %1   \n\t" 
      "cmpq      $10, %1   \n\t"
      "cmovneq   %0 , %1   \n\t" 
      : "=m"(*dst)
      : "r"(cond)
      : "cc"
   );
   
   return printf("gdst = %ld\n", gdst); 
}
