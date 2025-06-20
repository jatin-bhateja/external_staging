
#include "stdio.h"
#include "unistd.h"
#include "pthread.h"
#include "stdlib.h"
#include "string.h"
#include "stdint.h"
#include "sys/types.h"

#define PRINT(...) \
  do { \
    fprintf(stdout, "[TID=%lu] ", pthread_self()); \
    fprintf(stdout, __VA_ARGS__);                  \
    fflush(stdout);                                \
  } while(0)

//
// 
// 1) EGPRS are all caller save (call clobbered) registers.
// 2) Must be saved in caller's activation before invoking a callee. VM before transitioning
//    to runtime service explicitly saves register state.
// 3) Non-APX enabled OS is agnostic to EGPR state.
// 3) A context switch of application thread executing APX ISA may loose contents of EGPRs, thread context switch involves
//    saving processor architecture state comprising of GPRs, Vector Registers, Flags, instruction pointer and process runtime image (stack)
//    and restoring it back on target CPU, since OS is agnostic to EGPRs hence a context switch of application thread may show incorrect 
//    results. This is what we are experiencing after randomizing the allocation sequence.
// 4) To counter this, pin offers APIs for thread management[1][2]Excerpts from Pin User Manual.
// 5) JVM forks new application threads at startup, during the lifetime of application, methods
//    with high invocation counts are JIT compiled.
// 6) A frequently invoked method executes its JIT compiled code rather than interpreting assembly
//    template corresponding to its bytecode sequence.
// 7) Since JVM application threads are not-forked using SDE thread management APIs, hence it will
//    not be able to preserve the application thread's extended GPR state across thread migrations.
//
// [1] https://software.intel.com/sites/landingpage/pintool/docs/98484/Pin/html/index.html#:~:text=the%20standard%20library%20interfaces%20to%20manage%20threads%20in%20a%20Pintool.%20For%20example%2C%20Linux%20tools%20cannot%20use%20the%20pthreads%20library%20and%20Windows%20tools%20should%20not%20use%20the%20Win32%20API%27s%20to%20manage%20threads.%20Instead%2C%20Pin%20provides%20its%20own%20locking%20and%20thread%20management%20API%27s%2C%20which%20the%20Pintool%20should%20use.
// [2] https://software.intel.com/sites/landingpage/pintool/docs/98484/Pin/html/index.html#:~:text=Pin%20provides%20call%2Dbacks%20when%20each%20thread%20starts%20and%20ends%20(see%20PIN_AddThreadStartFunction%20and%20PIN_AddThreadFiniFunction).%20These%20provide%20a%20convenient%20place%20for%20a%20Pintool%20to%20allocate%20and%20manipulate%20thread%20local%20data%20and%20store%20it%20on%20a%20thread%27s%20local%20storage

typedef struct _egprs {
  long r16;
  long r17;
  long r18;
  long r19;
  long r20;
  long r21;
  long r22;
  long r23;
  long r24;
  long r25;
  long r26;
  long r27;
  long r28;
  long r29;
  long r30;
  long r31;
} egprs;

volatile uint64_t ret_pc = 0x0;

void* func(void * data) {
  egprs restore_data;
  memset((char*)&restore_data, 0, sizeof(egprs));
  void* dest = &restore_data;
  PRINT("Entered function..\n");
  PRINT("Saving EGPR state..\n");
  asm volatile (
     "movq %0 ,          %%rsi \n\t"
     "movq 0x0(%%rsi),   %%r16 \n\t"     
     "movq 0x8(%%rsi),   %%r17 \n\t"     
     "movq 0x10(%%rsi),  %%r18 \n\t"     
     "movq 0x18(%%rsi),  %%r19 \n\t"     
     "movq 0x20(%%rsi),  %%r20 \n\t"     
     "movq 0x28(%%rsi),  %%r21 \n\t"     
     "movq 0x30(%%rsi),  %%r22 \n\t"     
     "movq 0x38(%%rsi),  %%r23 \n\t"     
     "movq 0x40(%%rsi),  %%r24 \n\t"     
     "movq 0x48(%%rsi),  %%r25 \n\t"     
     "movq 0x50(%%rsi),  %%r26 \n\t"     
     "movq 0x58(%%rsi),  %%r27 \n\t"     
     "movq 0x60(%%rsi),  %%r28 \n\t"     
     "movq 0x68(%%rsi),  %%r29 \n\t"     
     "movq 0x70(%%rsi),  %%r30 \n\t"     
     "movq 0x78(%%rsi),  %%r31 \n\t"     
     "movq $rip       ,  %2    \n\t"
     "sfence                   \n\t"
     "movq $0,           %%rax \n\t"
     "movq $1,      0x8(%%rax) \n\t"
     "movq %0 ,         %%rdi \n\t"
     "movq %%r16,  0x0(%%rdi) \n\t"     
     "movq %%r17,  0x8(%%rdi) \n\t"     
     "movq %%r18, 0x10(%%rdi) \n\t"     
     "movq %%r19, 0x18(%%rdi) \n\t"     
     "movq %%r20, 0x20(%%rdi) \n\t"     
     "movq %%r21, 0x28(%%rdi) \n\t"     
     "movq %%r22, 0x30(%%rdi) \n\t"     
     "movq %%r23, 0x38(%%rdi) \n\t"     
     "movq %%r24, 0x40(%%rdi) \n\t"     
     "movq %%r25, 0x48(%%rdi) \n\t"     
     "movq %%r26, 0x50(%%rdi) \n\t"     
     "movq %%r27, 0x58(%%rdi) \n\t"     
     "movq %%r28, 0x60(%%rdi) \n\t"     
     "movq %%r29, 0x68(%%rdi) \n\t"     
     "movq %%r30, 0x70(%%rdi) \n\t"     
     "movq %%r31, 0x78(%%rdi) \n\t"     
    : "=r"(dest), "=m"(&ret_pc)
    : "r"(data)
    : "%r16", "%r17", "%r18", "%r19" , "%r20", "%r21" , "%r22", "%r23", "%r24", "%r25", "%r26", "%r27", "%r28", "%r28", "%r29", "%r30", "%r31", "%rsi", "%rdi"
  );
  PRINT("Synthetic SIGSEGV..\n");
  PRINT("Returned from signal handler..\n");
  PRINT("Restored EGPR state..\n");

  for (int i = 0; i < sizeof(egprs)/sizeof(long); i++) {
     long saved = *((long*)((char*)data + sizeof(long)*i));
     long restore = *((long*)((char*)&restore_data + sizeof(long)*i));
     if (saved != restore) {
        char reg[16] = {'\0'};
        sprintf(reg, "%%r%d", i + 16);
        PRINT("Incorrect %s restoration => saved[=%ld] : restored[=%ld]\n", reg, saved, restore);
     }
  }
  PRINT("Successful state restoration..\n");
  return 0;
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    printf("Incorrect Arguments!\n");
    return -1;
  }
  int threads = atoi(argv[1]);
  printf("Thread Count = %d\n", threads);
  pthread_t tids[threads];
  for (int i = 0; i < threads; i++) {
     egprs data;
     memset((char*)&data, 0, sizeof(egprs));
     for (int j = 0; j < sizeof(egprs)/sizeof(long); j++) {
       *((long*)((char*)&data + j * sizeof(long))) = j + i*sizeof(egprs);
     }
     pthread_create(&tids[i], 0x0, func, &data);
     //func(&data);
  }
  for (int i = 0; i < threads; i++) {
     pthread_join(tids[i], 0x0);
  } 
  return 0;
}
