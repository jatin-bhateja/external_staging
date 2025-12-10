
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
  BUSY_WAITING,
  ACTIVE,
  KILL
};

typedef struct _work {
  char* start;
  long len;
  kernel* kernel;
} work;

typedef struct _tdata {
  std::vector<work*>* work_list;
  int* flag;
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
  std::vector<work*> work_list = tdata->work_list;
  while (true) {
    int* worker_status = tdata->flag;
    for (int i = 0; i < WITER; i++) {
      std::for_each(work_list.cbegin(), work_list.cend(), [=](work* w) { w->kernel(w->start, w->len); });
    }
    auto start =  std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITER; i++) {
      std::for_each(work_list.cbegin(), work_list.cend(), [=](work* w) { w->kernel(w->start, w->len); });
    }
    auto end =  std::chrono::high_resolution_clock::now();
    if(*work_status == KILL) {
      break;
    }
    // redundant looping will increase the path length.
    // avoid it using pause.
    *work_status = BUSY_WAITING;
    asm volatile ("pause \n\t" : : :);
    *work_status = ACTIVE;
  }
}

void lanunch_workers(pthread_t* workers, std::vector<thread_data*> worker_data, int num_workers) {
   for (int i = 0; i < num_workers; i++) {

   }
}

// Beautify using C++ STL structures.
bool check_if_all_work_finished(std::vector<therad_data*> tdata, int num_workers) {
   return std::all_of(tdata.cbegin(), tdata.cend(),
                      [=](therad_data* data) {
                        return data->work_status == BUSY_WAITING;
                      }); 
}

void launch_master(int num_workers, int len, kernel* micro) {
  char* dst = (char*)malloc((int)len);
  pthread_t workers[num_workers];
  std::vector<work*> gwork = prepare_global_worklist(num_workers, );
  tdata* worker_data = prepare_thead_data();
  while (
}

int main(int argc, char* argv[]) {
  if (argc != 4) {
    return fprintf(stderr, "Incorrect Arguments : <app> <algo> <workers> <len> \n");
  }
  int algo = atoi(argv[1]);
  int threads = atoi(argv[2]);
  long len = atol(argv[3]);

  launch_master(threads, len, algo == 0 ? micro1 : micro2);
  if (algo == 0) {
    for (int i = 0; i < WITER; i++) {
      mem_set(dst, len);
    }
    auto start =  std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITER; i++) {
      mem_set(dst, len);
    }
    auto end =  std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double>(end - start);
    fprintf(stdout, "[len] %ld bytes [time rep stos] %lf ns  [res] %ld\n", len, duration.count(), hashcode(dst));
  } else {
    for (int i = 0; i < WITER; i++) {
      mem_set_vector(dst, len);
    }
    auto start =  std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITER; i++) {
      mem_set_vector(dst, len);
    }
    auto end =  std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration<double>(end - start);
    fprintf(stdout, "[len] %ld bytes [time vec] %lf ns  [res] %ld\n", len, duration.count(), hashcode(dst));
  }
  free(dst);
}
