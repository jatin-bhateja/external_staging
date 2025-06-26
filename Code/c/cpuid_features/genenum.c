
#include <stdio.h>

int main() {
   for (int i = 0; i < 70; i++) {
      printf("FEATURE%d = 1ULL << %d,\n", i, i);
   }
   return 0;
}
