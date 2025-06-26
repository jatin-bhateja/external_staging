
#include "iacaMarks.h"
#include "stdio.h"
#include "stdlib.h"

#define LEN 64

void rotate(int * vec, int * ret, int vlen, int N) {
  if (N < 1)
     return;

  int tmp[N];
  int titr = N-1;
  int vitr = vlen-1;

  IACA_START;
  for (int i = 0 ; i < N ; i++)
     tmp[titr-i] = vec[vitr-i];

  for (int i = 0; i <= vitr - N; i++)
     ret[vitr-i] = vec[vitr - N - i];

  for ( int i = 0 ; i < N ; i++)
     ret[i] = tmp[i];

  IACA_END;
}

int * vec = NULL;
int * res = NULL;

int main() {
  vec = malloc(sizeof(int)*LEN);
  res = malloc(sizeof(int)*LEN);
  rotate(vec, res, LEN , 2);
  return 0; 
}
