#ifndef __COMMON_H_
#define __COMMON_H_
#ifdef LINUX
#define _GNU_SOURCE
#include <unistd.h>
#include <sys/timeb.h>
#include <sys/time.h>
#include <sched.h>
#include <pthread.h>
#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <sched.h>
#include <sys/shm.h>
#include <errno.h>
#include <stdint.h>
#include <signal.h>
#include <glob.h>
#include <sys/syscall.h>
#else
#include <windows.h>
#include <winbase.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#endif

// defines for instruction types supported
#define TEMPORAL_LOADS	1
#define TEMPORAL_STORES	2
#define MOVNTI			3
#define REPSTOSB		4
#define PAUSE			5
#define LOCK			6
#define RMW_CLWB		7
#define RMW_CLFLUSHOPT	8
#define FP_OPS			9
#define CLFLUSH_LATENCY		10

#define REPMOVS_MEMCPY		11
#define MY_MEMCPY		12
#define GLIBC_MEMCPY		13
#define CLFLUSHOPT_LATENCY		14
#define LARGE_VA_ALLOC		15
#define LARGE_STRIDE_LATENCY		16
#define USELESS_PREF_TEST		17
#define LOAD_STORE_MIXED		18
#define SW_PREFETCH			19
#define PTR_CHASE_LATENCY			20
#define BUSY_LOOP			21


#define MAX_RAND_SIZE 4096

typedef unsigned long long int UINT64;

#ifdef LINUX
typedef long long int __int64;
#endif

#define MAX_THREADS 1024
#define MAP_HUGE_SHIFT  26
#define MAP_HUGE_MASK   0x3f
#define MAP_HUGE_2MB    (21 << MAP_HUGE_SHIFT)
#define MAP_HUGE_1GB    (30 << MAP_HUGE_SHIFT)

struct _tdData
{
	int cpuid;
	int mem_init_cpuid;
	char *src_addr;
	char *src_addr2;
	__int64 src_size;
	__int64 va_size;
	__int64 src_size2;
	__int64 total_cycles;
	__int64 total_operating_cycles;
	__int64 total_accessed;
} *tdp;


void NopLoop(__int64 iter);
void Calibrate(UINT64   *ClksPerSec);
char *allocate_memory(__int64 len);
void touch_buffer(char*buf, __int64 len);

void print_latency(char *type, __int64 delta, __int64 iter);
void print_bandwidth(char *type, __int64 delta, __int64 iter, __int64 bufsize);
__int64 parse_number(char *str);
char *allocate_pmem(char *path, __int64 len);

int BindToCpu(int cpu_num);
int repsto_instr (char *dst, __int64 len, __int64 iter);
int repmov_instr (char *dst, char *src, __int64 len, __int64 iter);
int my_memcpy (char *dst, char *src, __int64 len, __int64 iter);
int glibc_memcpy (char *dst, char *src, __int64 len, __int64 iter);

int pause_instr (__int64 iter);
int movnti_instr (char *dst, __int64 len, __int64 iter);
int fp_instr (__int64 iter);

int temporal_stores_instr (char *addr, __int64 len, __int64 iter);
int temporal_stores_clflush_instr (char *addr, __int64 len, __int64 iter);
int temporal_RMW_clwb_instr (char *addr, __int64 len, __int64 iter);
int temporal_RMW_clflush_instr (char *addr, __int64 len, __int64 iter);

int temporal_loads_instr (char *addr, __int64 len, __int64 iter);
int temporal_64B_sse2_loads_instr (char *addr, __int64 len, __int64 iter);
int temporal_64B_avx2_loads_instr (char *addr, __int64 len, __int64 iter);
int temporal_64B_avx3_loads_instr (char *addr, __int64 len, __int64 iter);

int temporal_64B_sse2_stores_instr (char *addr, __int64 len, __int64 iter);
int temporal_64B_avx2_stores_instr (char *addr, __int64 len, __int64 iter);
int temporal_64B_avx3_stores_instr (char *addr, __int64 len, __int64 iter);

int temporal_loads_clflush_instr (char *addr, __int64 len, __int64 iter);
int lock_instr (char *addr, __int64 len, __int64 iter);
int load_data_prior_to_clflush (char *addr, __int64 len);
int clflush_instr_latency (char *addr, __int64 len, __int64 iter);
int setup_random_access (char *src_addr, __int64 va_to_allocate, __int64 src_size);
char * reserve_address(__int64 len);
int setup_large_stride_access (char *addr, __int64 size, int num_lines);
int large_stride_latency_access(char *addr, __int64 iter);
int useless_prefetch_test(char *addr, __int64 iter);
int setup_useless_pref_access(char *addr, __int64 sz, __int64 offset, int num_lines);
int load_store_mixed(char *src1, char *src2, __int64 sz, __int64 ratio, __int64 iter);
int sw_prefetch_test(char *addr, __int64 bufsize, __int64 chunksize, __int64 iter);
int exec_swprefetch (char *addr, __int64 len);
void populate_rand_array(int *rand_array, int max_size);
void Create_random_pattern(UINT64** buf, __int64 size);
void evict_line_from_cache(volatile void *ptr);
UINT64 read_msr(char * msrDevPName, int msrNum, UINT64 msrValue);
UINT64 write_msr(char * msrDevPName, int msrNum, UINT64 msrValue);
UINT64 get_msr_value(int cpu, int msrNum);
void do_busy_loop(__int64 iter);

UINT64* do_specified_dependent_read(UINT64* a, UINT64 iter);

extern void parse_user_cpulist(char *list);
extern int check_for_valid_chars_in_cpu_range(char *s);
extern unsigned long long get_physaddr(void *vaddr);
extern void initialize_mem_for_ptr_chasing(char* buf, UINT64 buf_len);
extern void dependent_read_latency(char *buf, __int64 bufsize, __int64 iter);
extern void do_64B_reads(char* buf, __int64 len);


extern int ld_st_ratio;
extern int repornti;
extern int numcpus;
extern double NsecClk;
extern UINT64 ClksPerSec;
extern int num_lines;
extern __int64 bufsize;
extern __int64 iter;
extern int instr_type;
extern int runcpu, lp_enabled, alloc_done;
extern char pmem_path[256];
extern int pmem_allocation;
extern int clflush;
extern int initmem_cpu;
extern int os_cpu_count;
extern __int64 stride;
extern int cpu_list[MAX_THREADS];
extern __int64 va_to_allocate;
extern int lp_1GB_enabled;
extern int initmemcpu;
extern int Random_Access;
extern int max_rand_size;
extern int *rand_array;
extern __int64 evict_line_size;

#ifdef LINUX
static inline unsigned long long rdtsc ()
{
  unsigned long var;
  unsigned int hi, lo;

  asm volatile (
	"mfence \n\r"
	"rdtsc \n\r"
	"mfence \n\r" 
	: "=a" (lo), "=d" (hi));
  var = ((unsigned long long int) hi << 32) | lo;

  return var;
}
#else
static unsigned long long rdtsc()
{
	__asm {

		mfence
		rdtsc
		mfence
		shl rdx, 20h
		or rax, rdx
	}
}
#endif

#ifndef LINUX
int win_rand();
#endif

#endif

