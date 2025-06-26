
#include <stdio.h>
#include <stdlib.h>
#include <chrono>

int micro1(double src) {
   int res = 0;
   asm volatile (
     "movl $0, %%eax         \n\t" 
     "pextrw $3 , %1 , %%ecx \n\t"
     "movl $32768, %%edx     \n\t"
     "andl %%ecx, %%edx      \n\t"
     "andl $32767, %%ecx     \n\t"
     "cmpl $16438, %%ecx     \n\t"
     "jb   done              \n\t"
     "movl $1, %%eax         \n\t"
     "done:                  \n\t"
     "movl %%eax, %0         \n\t"
     : "=r"(res)
     : "x"(src)
     : "%eax", "%ecx", "%edx", "cc"
   );
   return res;
}

int micro2(double src) {
   int res = 0;
   asm volatile (
     "movl $0, %%eax                  \n\t"
     "mov $4626885667169763328, %%rcx \n\t"
     "movq %%rcx, %%xmm0              \n\t"
     "ucomisd %%xmm0, %1              \n\t"
     "jb  done1                       \n\t"
     "movl $1, %%eax                  \n\t"
     "done1:                          \n\t"
     "movl %%eax, %0                  \n\t"
     : "=r"(res)
     : "x"(src)
     : "%eax", "%rcx", "cc", "%xmm0"
   );
   return res;
}

int micro3(double src) {
   int res = 0;
   asm volatile (
     "movl $0, %%eax                   \n\t"
     "mov $4626885667169763328, %%rcx  \n\t"
     "movq %%rcx, %%xmm1               \n\t"
     "movq %1, %%rdx                   \n\t"
     "movq $0x7FFFFFFFFFFFFFFF, %%rbx  \n\t"
     "andq %%rbx, %%rdx                \n\t"
     "movq %%rdx, %%xmm0               \n\t" 
     "ucomisd %%xmm1, %%xmm0           \n\t"
     "jb   done2                       \n\t"
     "movl $1, %%eax                   \n\t"
     "done2:                           \n\t"
     "movl %%eax, %0                   \n\t"
     : "=r"(res)
     : "x"(src)
     : "%eax", "%rcx", "%rbx","%rdx", "cc", "%xmm0", "%xmm1"
   );
   return res;
}

int main(int argc, char * argv[]) {
   if (argc != 2) {
      return printf("./app <num> \n");
   }
   int res = 0;
   double value = atof(argv[1]);
   for (int i = 0 ; i < 100000000; i++) {
       res += micro1(value);
   }
   res = 0;
   auto start = std::chrono::high_resolution_clock::now();
   for (int i = 0 ; i < 100000000; i++) {
       res += micro1(value);
   }
   auto end = std::chrono::high_resolution_clock::now();
   auto diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

   printf("[time micro1] %ld ms [res] %d\n", diff.count(), res);

   res = 0;
   for (int i = 0 ; i < 100000000; i++) {
       res += micro2(value);
   }
   res = 0;
   start = std::chrono::high_resolution_clock::now();
   for (int i = 0 ; i < 100000000; i++) {
       res += micro2(value);
   }
   end = std::chrono::high_resolution_clock::now();
   diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

   printf("[time micro2] %ld ms [res] %d\n", diff.count(), res);

   res = 0;
   for (int i = 0 ; i < 100000000; i++) {
       res += micro3(value);
   }
   res = 0;
   start = std::chrono::high_resolution_clock::now();
   for (int i = 0 ; i < 100000000; i++) {
       res += micro3(value);
   }
   end = std::chrono::high_resolution_clock::now();
   diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

   printf("[time micro3] %ld ms [res] %d\n", diff.count(), res);
   return 0;
}
