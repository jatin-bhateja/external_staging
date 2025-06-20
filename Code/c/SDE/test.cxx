

#include <pthread.h>
#include <stdio.h>
#include <iostream>
#include <string.h> 

typedef struct _thread_data {
  int id;
  int* mem;
} thread_data;

void* kernel(void * data) {
   thread_data * td = static_cast<thread_data*>(data);
   std::cout << "Thread ID = " << td->id << std::endl;
   asm volatile(
      "movq %0, %%r24         \n\t"
      "addq $54, %%r24, %%r24 \n\t"
      "movq %%r24, %0         \n\t"
     : "+m"(*td->mem)
     : 
     : "cc" , "%r24"
   );
   return td;
}

int main(int argc, char * argv[]) {
   if (argc != 2) {
      std::cerr << "Incorrect thread count!" << std::endl;
      return -1;
   }
   int tcount = atoi(argv[1]); 
   std::cout << "Thead Count = " << tcount << std::endl; 
   int* arr = new int[tcount];
   memset(arr, sizeof(int)*tcount, 0);
   pthread_t tid[tcount];
   thread_data tds[tcount];
   for (int i = 0; i < tcount; i++) {
      tds[i].id = i;
      tds[i].mem = &arr[i];
      pthread_create(&tid[i], nullptr, kernel, &tds[i]); 
   }
   for (int i = 0; i < tcount; i++) {
      pthread_join(tid[i], nullptr); 
   }
   for (int i = 0; i < tcount; i++) {
      std::cout << arr[i] << std::endl;
   }
   return 0;
}
