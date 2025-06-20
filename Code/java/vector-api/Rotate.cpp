#include <immintrin.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void printVec(__v8si vec, int len) {
  printf("\n");
  for(int i = 0 ; i < len ;i++)
    printf("%d " , vec[i]);
  printf("\n");
}

#define VL 8

int mem[] __attribute__((aligned(32))) = {10,20,30,40,50,60,70,80};
int mask[] __attribute__((aligned(32))) = {0,0,-1,-1,-1,-1,-1,-1};
int shuf_idx[] __attribute__((aligned(32))) = {0,0,0,1,2,3,4,5};

int shiftEL() {
  __v8si res;
  __v8si mem_vec;
  __v8si mask_vec;
  __v8si shuf_idx_vec;
    
	// AT&T
      asm volatile(
        "vmovdqu      %4 , %1 \n\t"  
        "vmovdqu      %5 , %2 \n\t"  
        "vmovdqu      %6 , %3 \n\t"  
        "vpermd       %1 , %3 , %0 \n\t"
        "vpand        %2 , %0 , %0 \n\t"
	: "+v"(res) , "+v"(mem_vec) , "+v"(mask_vec) , "+v"(shuf_idx_vec)
	: "m"(mem[0]) , "m"(mask[0]) , "m"(shuf_idx[0])
      );
	printVec(res,8);
	return res[2];
}


int rotate_matrix[][8] = {
    {0,1,2,3,4,5,6,7},
    {7,0,1,2,3,4,5,6},
    {6,7,0,1,2,3,4,5},
    {5,6,7,0,1,2,3,4},
    {4,5,6,7,0,1,2,3},
    {3,4,5,6,7,0,1,2},
    {2,3,4,5,6,7,0,1},
    {1,2,3,4,5,6,7,0}
};
int shuf_idx_rot[] __attribute__((aligned(32))) = {0,0,0,0,0,0,0,0};

int rotateEL(int N) {
  __v8si res;
  __v8si mem_vec;
  __v8si mask_vec;
  __v8si shuf_idx_rot_vec;
    
  N = N & (VL-1);  // mod operation.
  memcpy(shuf_idx_rot, rotate_matrix[N], sizeof(shuf_idx_rot));

  

  // AT&T
  asm volatile(
     "vmovdqu      %3 , %1 \n\t"  
     "vmovdqu      %4 , %2 \n\t"  
     "vpermd       %1 , %2 , %0 \n\t"
    : "=v"(res) , "+v"(mem_vec) , "+v"(shuf_idx_rot_vec)
    : "m"(mem[0]) , "m"(shuf_idx_rot[0])
   );
   printVec(res,8);
   return res[2];
}

int main(int argc, char * argv[]) {
  int init = 1;
  return shiftEL() + rotateEL(atoi(argv[1]));
}

