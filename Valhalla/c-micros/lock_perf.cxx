
#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<chrono>

__attribute__((aligned(8)))
long global_lock = 0;

#ifdef SYNC_PRIMITIVES
void lock_acquire(long* lock) {
  asm volatile (
     "test:             \n\t"
     "cmpl $1, %0       \n\t"
     "je spin           \n\t"
     "movq $1, %%rbx    \n\t"
     "xorq %%rax, %%rax \n\t"
     "lock cmpxchgq %%rbx, %0 \n\t"
     "jz acquired       \n\t"
     "spin:             \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    pause         \n\t"
     "    jmp test      \n\t"
     "acquired:         \n\t"
    : "+m"(*lock) : : "cc", "%rax", "%rbx"
  );
}

void lock_release(long* lock) {
  *lock = 0;
}
#else
void lock_acquire(long* lock) {}
void lock_release(long* lock) {}
#endif

typedef struct _thread_data {
  int tid;
  long* counter;
  long count;
  long start_count;
  long end_count;
} thread_data;

void* kernel(void* tdata) {
  thread_data* data = (thread_data*)tdata;
  lock_acquire(&global_lock);
  data->start_count = *data->counter;
  for (long i = 0; i < data->count; i++) {
    *data->counter += 1;
  }
  data->end_count = *data->counter;
  printf("[tid:%d] %ld \n", data->tid, data->count);
  lock_release(&global_lock);
  return nullptr;
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    return fprintf(stderr, "Incorrect arguments: app <thread_count> !\n");
  }
  int threads = atoi(argv[1]);
  pthread_t tids[threads];
  thread_data tdata[threads];
  long shared_counter = 0;
  for (int i = 0; i < threads; i++) {
    tdata[i].tid = i;
    tdata[i].counter = &shared_counter;
    tdata[i].count = 100000;
  }

  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < threads; i++) {
    pthread_create(&tids[i], nullptr, kernel, &tdata[i]);
  }
  for (int i = 0; i < threads; i++) {
    pthread_join(tids[i], nullptr);
  }
  auto stop = std::chrono::high_resolution_clock::now();
  auto duration = std::chrono::duration<double>(stop - start);
  printf("Final data:\n");
  for (int i = 0; i < threads; i++) {
     printf("thread %d : start_count %ld end_count : %ld\n", tdata[i].tid, tdata[i].start_count, tdata[i].end_count);
  }
  printf("shared_counter : %ld \n", shared_counter);
  printf("time : %lf src \n", duration.count());
  return 0;
}
