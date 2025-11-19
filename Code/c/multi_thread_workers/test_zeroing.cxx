
#include <stdio.h>
#include <stdlib.h>
#include <chrono>
#include <string.h>
#include <pthread.h>
#include <list>
#include <vector>
#include <algorithm>

void micro1(char* dst, long len) {
   asm volatile (
      "movq %1, %%rcx \n\t"
      "xorq %%rax, %%rax \n\t"
      "movq %0, %%rdi \n\t"
      "rep stosb \n\t"
     : "=m"(dst)
     : "r"(len)
     : "%rcx", "%eax", "%rdi"
   );
}

void micro2(char* dst, long len) {
   asm volatile (
     "vpxorq %%zmm0, %%zmm0, %%zmm0 \n\t"
     "cmpq $128, %1                 \n\t"
     "jl lt128                      \n\t"
     "subq $128, %1                 \n\t"
     "loop:                         \n\t"
     "vmovdqu64 %%zmm0, (%%rdi)     \n\t"
     "vmovdqu64 %%zmm0, 0x40(%%rdi) \n\t"
     "addq $128, %%rdi              \n\t"
     "subq $128, %1                 \n\t"
     "jg loop                       \n\t"
     "addq $128, %1                 \n\t"
     "lt128:                        \n\t"
     "cmpq $64,  %1                 \n\t"
     "jl lt64                       \n\t"
     "vmovdqu64 %%zmm0, (%%rdi)     \n\t"
     "addq $64, %%rdi               \n\t"
     "subq $64, %1                  \n\t"
     "lt64:                         \n\t"
     "cmpq $0, %1                   \n\t"
     "je end                        \n\t"
     "mov $-1, %%rax                \n\t"
     "bzhiq %1, %%rax, %%rax        \n\t"
     "kmovq %%rax, %%k1             \n\t"
     "vmovdqu8 %%zmm0, (%%rdi) %{%%k1} \n\t"
     "end:                          \n\t"
     : "=m"(dst)
     : "r"(len)
     : "%rax", "%rdi", "%zmm0"
   );
}

uint64_t hashcode(const char* str) {
  uint64_t res = 0;
  int idx = 0;
  while(*str != '\0') {
    res += idx++ * *(str++);
  }
  return res;
}

typedef void (*kernel)(char* dst, long len);

#define WITER 10000
#define ITER 10000

enum {
  KILL = 99
};

typedef struct _work {
  kernel micro;
  long len;
  char* start;
} work;

typedef struct _tdata {
  int flag;
  work* work_item;
} thread_data;

//
//  Threading scheme.
//  Master: populate work in global worklist.
//    -- allocate work from list.
//    -- check worker status, allocate more work.
//    -- kill workers if all work done.
//    -- optional : load balance if one worker is heavily loaded.
//    -- optional : keep the record the busywaiting duration of each worker.
//  Worker (pool):
//    -- poll its work queue
//    -- busy wait if no work.
//    -- set its work_status
//
//  Fine nuances for dyanmic load work allocation and load balancing :-
//    -- Master cannot simultaneously add the work items at end of list 
//       while it is being traversed by worker, this is because
//       there will be a read-write race at edge.
//    -- Two lists per worker, active queue and pending queue
//       LOCK CMPXCHG head of pending and active one all the work items
//       are processed on active queue.
//    -- Master keep adding new work or load balance items to pending
//       queue of workers
//    -- A single std::vector is not correct structure for dynamic work
//       scaling. Since its contiguous memory and addition of new items
//       by producer may reallocate the memory, thereby consumer may  
//       continue accessing stale or freed worklist. 
//    -- Active-pending worklist model work well in this case.
//  
//
void* worker(void * data) {
  thread_data* tdata = static_cast<thread_data*>(data);
  work* work_item = tdata->work_item;
  while (true) {
    int worker_status = tdata->flag;
    if(worker_status == KILL) {
      break;
    }

    for (int i = 0; i < WITER; i++) {
      work_item->micro(work_item->start, work_item->len);
    }
    auto start =  std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITER; i++) {
      work_item->micro(work_item->start, work_item->len);
    }
    auto end =  std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double>(end - start);
    fprintf(stdout, "[len] %ld bytes [time] %lf ns [res] %ld\n", work_item->len, duration.count(), hashcode(work_item->start));
    fflush(stdout);
  }
  return nullptr;
}

void launch_workers(int threads, int len, kernel micro) {
  pthread_t workers[threads];
  char* mem = (char*)malloc(len);
  int quanta = len / threads;
  thread_data* tasks = (thread_data*)malloc(sizeof(thread_data)* threads);
  for (int i = 0; i < threads; i++) {
    work* work_item = (work*)malloc(sizeof(work));
    work_item->len = quanta;
    work_item->micro = micro;
    work_item->start = mem + i * quanta;
    tasks[i].work_item = work_item;
    tasks[i].flag = -1;
  }
  int fractional = len % threads;
  if (fractional != 0) {
    tasks[threads - 1].work_item->len += fractional; 
  }
  for (int i = 0; i < threads; i++) {
    pthread_create(&workers[i], nullptr, worker, static_cast<void*>(tasks + i));
  }

  int delay = 10000;
  while (delay > 0) {
    asm volatile("pause \n\t" : : :);
    delay--;
  }

  // Let threads gracefully exit at safepoint.
  for (int i = 0; i < threads; i++) {
    tasks[i].flag = KILL;
  }

  for (int i = 0; i < threads; i++) {
    pthread_join(workers[i], nullptr);
  }
}

int main(int argc, char* argv[]) {
  if (argc != 4) {
    return fprintf(stderr, "Incorrect Arguments : <app> <algo> <workers> <len> \n");
  }
  int algo = atoi(argv[1]);
  int threads = atoi(argv[2]);
  long len = atol(argv[3]);

  launch_workers(threads, len, algo == 0 ? micro1 : micro2);
  return 0;
}
