
#include<stdio.h>

int main() {
  int perm[16][4] = {0};
  for (int i = 0; i < 16; i++) {
     int j = 0;
     int index = 0;
     int tmp = i;
     while (tmp) {
        asm volatile ("bsf %1, %0 \n\t" : "+r"(index) : "r"(tmp) : "cc");
        perm[i][j++] = index; 
        asm volatile ("blsr %1, %0 \n\t" : "+r"(tmp) : "r"(tmp) : "cc");
     }
     for (; j < 4; j++) {
        perm[i][j] = -1; 
     }
  }
  int ctr = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 4; j++) {
        if ((ctr % 8) == 0) {
          printf("\n");
        }
        printf(" %2dL,", perm[i][j]);
        ctr++;
    }
  }
  printf("\n");
}
