
#include <stdio.h>

void leaf() {
   printf("leaf\n");
}

int mid() {
   printf("mid\n");
   leaf();
   return 10;
}

int top() {
   printf("top\n");
   return mid() + 20;
}

int main() {
   return top(); 
}
