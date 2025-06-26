
#include<stdio.h>

int main() {
  int perm[256][8] = {0};
  for (int i = 0; i < 256; i++) {
     int j = 0;
     int index = 0;
     int tmp = i;
     while (tmp) {
        asm volatile ("bsf %1, %0 \n\t" : "+r"(index) : "r"(tmp) : "cc");
        perm[i][j++] = index; 
        asm volatile ("blsr %1, %0 \n\t" : "+r"(tmp) : "r"(tmp) : "cc");
     }
     for (; j < 8; j++) {
        perm[i][j] = -1; 
     }
  }
  int ctr = 0;
  for (int i = 0; i < 256; i++) {
    for (int j = 0; j < 8; j++) {
        if ((ctr % 16) == 0) {
          printf("\n");
        }
        printf(" %2d,", perm[i][j]);
        ctr++;
    }
  }
  printf("\n");
}
