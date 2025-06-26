
#include "stdio.h"

int main() {
  int eax=0x0D, ebx=0, ecx=7,edx=0;
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
#if 0
  int stepping_id = eax & 0xf;
  printf("    Stepping ID : %d \n ", stepping_id);
  int model = (eax & 0xf0) >> 4;
  printf("    Model       : %d \n ", model);
  int family_id = (eax & 0xf00) >> 8;
  printf("    Family ID   : %d \n ", family_id);
  int proc_type = (eax & 0x3000) >> 12;
  printf("    Proctype    : %s \n ", proct[proc_type]);
  int ext_model_id = (eax & 0xF0000) >> 16;
  printf("    Ext Model ID : %d \n ", ext_model_id);
  int ext_family_id = (eax & 0xFF00000) >> 20;
  printf("    Ext Family ID : %d \n", ext_family_id);
#endif
  printf("EBX = %x\n", ebx);
  printf("ECX = %x\n", ecx);
  return printf("EDX = %x\n", edx);
}

