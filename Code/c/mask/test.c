#include "stdio.h"
#include "stdbool.h"

__attribute__((noinline))
int micro(int * cond, int * r, int * a, int *  b) {
  for(int i = 0 ; i < 1024; i++) {
    int r_tmp = 0;
    if (cond[i])
      r_tmp = a[i] + b[i];
    r[i] = r_tmp;
  }
  return r[20];
}

int main() {
  int a[1024];
  int b[1024];
  int c[1024];
  int r[1024];
  int cond[1024];
  for(int i = 0 ; i < 1024; i++) {
    a[i] = b[i] = c[i] = i + 10;
    cond[i] = i & 1;
  }
  int res = 0;
  for (int i = 0 ; i < 10000000 ;i++)
     res += micro(cond, r, a, b);
  return printf("%d \n ", res);
}
