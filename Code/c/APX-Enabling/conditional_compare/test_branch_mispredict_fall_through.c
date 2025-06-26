

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void micro(float* dst, float* src1, float* src2, int inner_loop_count, int outer_loop_count) {
  for (int i = 0 ; i < outer_loop_count; i++) {
     for (int j = 0; j < inner_loop_count; j++) {
         dst[i] += src1[j] * src2[j];
     }
  }
}


int main(int argc, char *argv[]) {
  if (argc != 4) {
     return fprintf(stderr, "Incorrect Arguments! ./app <inner_loop_count> <outer_loop_count>\n");
  }

  int inner_loop_count = atoi(argv[1]);
  int outer_loop_count = atoi(argv[2]);
  int ctr = atoi(argv[3]);

  float* dst  = malloc(sizeof(float) * outer_loop_count);
  float* src1 = malloc(sizeof(float) * inner_loop_count);
  float* src2 = malloc(sizeof(float) * inner_loop_count);

  memset(dst, sizeof(float) * outer_loop_count, 0);
  memset(src1, sizeof(float) * inner_loop_count, 1);
  memset(src2, sizeof(float) * inner_loop_count, 1);

  for (int ic = 0; ic < 10000; ic++) {
    micro(dst, src1, src2, inner_loop_count, outer_loop_count);
  }
  return fprintf(stdout, "[res] %f", dst[ctr]);
}
