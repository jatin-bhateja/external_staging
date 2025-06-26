


#include "stdio.h"

void xgetbv() {
  int eax = 0, edx = 0;
  asm volatile(
    "xgetbv          \n\t"
    "movl %%eax , %0 \n\t"
    "movl %%edx , %1 \n\t"
   : "=r"(eax) , "=r"(edx)
   : 
   : "%eax" , "%edx"
  );
  printf("EAX:EDX => %x:%x \n",eax,edx);
}

int main() {
  int eax=0x0D, ebx=0, ecx=5,edx=0;
  char * proct [] = {"Original OEM", "Intel Overdrive", "Dual Processor", "Intel Reserved"};
  asm volatile( 
                "movl %0 , %%eax \n\t"
                "movl %2 , %%ecx \n\t"
                "cpuid           \n\t"
                "movl %%eax , %0 \n\t"
                "movl %%ebx , %1 \n\t"
                "movl %%ecx , %2 \n\t"
                "movl %%edx , %3 \n\t"
               : "+r"(eax)  , "=r"(ebx), "+r"(ecx) ,"=r"(edx)
               :
               : "%eax", "%ebx", "%ecx" ,"%edx"
  );
  printf("EAX = %x\n", eax);
  printf("EDX = %x\n", edx);
  printf("EBX = %x\n", ebx);
  printf("ECX = %x\n", ecx);
  printf("XGETBV : ");
  xgetbv();
  return 0;
}





