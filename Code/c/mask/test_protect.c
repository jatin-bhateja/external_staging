
#include "stdio.h"
#include "xmmintrin.h"
#include "string.h"
#include "malloc.h"
#include "stdlib.h"
#define __GNU_SOURCE             /* See feature_test_macros(7) */
#include <sys/mman.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>

#define handle_error(msg) \
   do { perror(msg); exit(EXIT_FAILURE); } while (0)


__attribute__((noinline))
int masked_copy(int * dst , int * src , long mask) {
   asm volatile(
       "kmovq    %2   , %%k2            \n\t"
       "vmovdqu32 %1 , %%zmm0 {{%%k2}}   \n\t"
       "vmovdqu32 %%zmm0 , %0 {{%%k2}}   \n\t"
     : "=m"(*dst)
     : "m"(*src), "r"(mask)
     : "%zmm0" , "%k2"
   );
   return dst[0];
}

int main() {
  int  pagesize = sysconf(_SC_PAGE_SIZE);
  if (pagesize == -1)
     handle_error("sysconf");

  int * dst = (int*)memalign(pagesize, pagesize);
  if (dst == NULL)
     handle_error("memalign");

  int * src = (int*)memalign(pagesize, pagesize);
  memset(src, 1, 64);

  if ( -1 == mprotect(dst,60,PROT_WRITE))
    fprintf(stderr,"Protection error\n");

  return masked_copy(dst,src,7L);
}
