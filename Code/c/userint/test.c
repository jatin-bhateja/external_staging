
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define _GNU_SOURCE             /* See feature_test_macros(7) */
#include <sched.h>


void write_mem(int* poll_address, int val) {
  *poll_address = val;
}

void * install_monitor(void* poll_address) {
 int* addr = (int*)poll_address;
 fprintf(stdout, "Installing monitor....\n");
 asm volatile(
   "umonitor %0 \n\t"
  :: "r"(addr) :
 );
}

void* wait(void* poll_address) {
 int* addr = (int*)poll_address;
 fprintf(stdout, "Entering wait....\n");
 asm volatile(
    "mov $0 , %%rdx \n\t"
    "mov $1000000, %%rax \n\t"
    "umwait %0 \n\t"
  :: "r"(addr) : "%rax" , "%rdx"
 );
 fprintf(stdout, "Exiting wait....\n");
}

int main(int argc, char * argv[]) {

  cpu_set_t *cpusetp;
  cpusetp = CPU_ALLOC(2);
  if (cpusetp == NULL) {
     perror("CPU_ALLOC");
     exit(EXIT_FAILURE);
  }

  size = CPU_ALLOC_SIZE(2);
  CPU_ZERO_S(size, cpusetp);
  for (int cpu = 0; cpu < 2; cpu++)
     CPU_SET_S(cpu, size, cpusetp);


  int poll_page = 0;
  pthread_t t1;
  int status = pthread_create(&t1, NULL, install_monitor, &poll_page); 
  if (status != 0) {
    fprintf(stderr, "Thread1 creation error\n");
  }

  pthread_t t2;
  status = pthread_create(&t2, NULL, wait, &poll_page); 
  if (status != 0) {
    fprintf(stderr, "Thread2 creation error\n");
  }
 
  write_mem(&poll_page, 1);
  
  pthread_join(t1, NULL);
  pthread_join(t2, NULL);
  return 0;
}
