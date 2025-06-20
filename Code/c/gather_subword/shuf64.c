
#include <stdio.h>

void print_arr(const char* msg, int* arr, int length) {
  printf("%s:\n", msg);
  for (int i = 0; i < length; i++) {
     printf("%d ", arr[i]);
  }
  printf("\n");
}

void sub_arr(int* iota, int* decr, int length) {
  for(int i = 0; i < length; i++) {
      iota[i] -= decr[i];
  }
}

void lsb_bits(int* lsb, int* src, int length) {
  for(int i = 0; i < length; i++) {
      lsb[i] = src[i] & 0xf;
  }
}

int main () {
  int index[]  = { 0, 1, 2, 3, -8, -7, -6, -5};
  int values[] = { 100, 200, 300, 400, 500, 600, 700, 800, 900};
  int res[8] = {0}; 
  asm volatile (
      "vmovdqu %1, %%ymm1 \n\t"
      "vmovdqu %2, %%ymm2 \n\t"
      "vpermd  %%ymm1, %%ymm2, %%ymm1 \n\t"
      "vmovdqu %%ymm1, %0 \n\t"
    : "=m"(*res)
    : "m"(*values), "m"(index)
    : "%ymm1" , "%ymm2"
  );
  print_arr("Initial Array", values, sizeof(values)/ sizeof(int)); 
  print_arr("Permute Array", index, sizeof(index)/ sizeof(int)); 
  print_arr("Res Array", res, sizeof(res)/ sizeof(int)); 
  
  int iota [] = {
     0, 1, 2, 3,
     4, 5, 6, 7,
     8, 9, 10, 11,
     12, 13, 14, 15
  };
  int decr [] = {
     2, 2, 2, 2,
     2, 2, 2, 2,
     2, 2, 2, 2,
     2, 2, 2, 2
  };
  int lsb [] = {
     0, 0, 0, 0,
     0, 0, 0, 0,
     0, 0, 0, 0,
     0, 0, 0, 0,
  };
  print_arr("Initial Iota", iota, sizeof(iota)/sizeof(int));
  for (int i = 0; i < 7; i++) {
     char msg[64] = {'\0'};
     sprintf(msg, "Round %d", i+1);
     sub_arr(iota, decr, sizeof(iota)/sizeof(int));
     print_arr(msg, iota, sizeof(iota)/sizeof(int));
     lsb_bits(lsb, iota, sizeof(lsb)/sizeof(int));
     print_arr("LSB 4 bits", lsb, sizeof(lsb)/sizeof(int));
  }

  return 0; 
}
