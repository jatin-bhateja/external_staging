#include "common.h"

int repornti=0;
double NsecClk;
UINT64 ClksPerSec;
__int64 bufsize,iter=100;
__int64 va_to_allocate=0;
int instr_type=1;
int runcpu=-1, initmemcpu=-1;
int lp_enabled=0, alloc_done=0;
char pmem_path[256];
int pmem_allocation=0;
int user_cpulist_provided=0;
int clflush=0;
int numcpus=0;
__int64 stride = 64;
int os_cpu_count;
__int64 offset=0;
int num_lines=0;
int lp_1GB_enabled=0;
int ld_st_ratio=10;
int use_avx2=0;
int use_avx3=0;
int Random_Access=0;
int max_rand_size = MAX_RAND_SIZE;
__int64 evict_line_size=0;

int cpu_list[MAX_THREADS];
struct _tdData *tmp;
void Usage(char * str );
void print_latency_stats(struct _tdData *tdp);
void print_bw_stats(struct _tdData *tdp);

#ifdef LINUX
pthread_t td[MAX_THREADS];
unsigned int mem_alloc_thread(void* p);
unsigned int inst_exec_thread(void* p);

#else
HANDLE td[MAX_THREADS];
UINT WINAPI mem_alloc_thread(PVOID p);
UINT WINAPI inst_exec_thread(PVOID p);
DWORD tId;
#endif


int main(int argc, char **argv)
{
	int i;
	//int cnt, len,  rc ;
	//unsigned int mask;
	//char *p, *s, *d;
	//FILE *fp;
	
#if defined(LINUX)
	os_cpu_count = sysconf(_SC_NPROCESSORS_ONLN);
#else
	os_cpu_count = GetActiveProcessorCount(ALL_PROCESSOR_GROUPS);
#endif

	if (argc == 1) { // no argulments provided
		Usage(NULL);
		exit(1);
	}
	for (i = 1; (i < argc && argv[i][0] == '-'); i++) 
	{
		/* Check options */
		switch (argv[i][1]) 
		{
			case '?': 
			{  /* Help - print usage and exit */
				Usage( (char *) 0 );
			}

			case 'b': 
			{  
				bufsize = parse_number( &argv[i][2] );
				break;
			}
			case 'c': 
			{  
				runcpu = atoi( &argv[i][2] );
				break;
			}
			case 'n': 
			{  
				iter = parse_number( &argv[i][2] );
				break;
			}
			case 'i': 
			{  
				initmemcpu = atoi( &argv[i][2] );
				break;
			}

			case 'k': 
			{  
				user_cpulist_provided=1;
				parse_user_cpulist( &argv[i][2] );
				break;
			}
			case 'v': 
			{  
				
				va_to_allocate = parse_number( &argv[i][2] );
				break;
			}
			case 'x':
			{
				instr_type = atoi( &argv[i][2] );
				break;
			}
			case 'D':
			{
				max_rand_size = atoi( &argv[i][2] );
				break;
			}
			case 'l':
			{
				stride = parse_number( &argv[i][2] );
				break;
			}
			case 'e':
			{
				evict_line_size = parse_number( &argv[i][2] );
				break;
			}
			case 'J':
			{
				pmem_allocation = 1;
				strcpy(pmem_path, &argv[i][2]);
				break;
			}
			case 'F':
			{
				clflush = 1;
				break;
			}
			case 'H':
			{
				lp_1GB_enabled = 1;
				break;
			}
			case 'r':
			{
				Random_Access = 1;
				break;
			}
			case 'L':
			{
				lp_enabled = 1;
				break;
			}
			case 'o':
			{
				offset = atoi( &argv[i][2] ); 
				ld_st_ratio = offset; // we are overloading this option - ugly..
				break;
			}
			case 'p':
			{
				num_lines = parse_number( &argv[i][2] ); 
				break;
			}
			case 'Y':
			{
				use_avx2 = 1; 
				break;
			}
			case 'Z':
			{
				use_avx3 = 1; 
				break;
			}
			default:
				break;
		}
	}
	/*
	if (clflush && instr_type != TEMPORAL_LOADS && instr_type != TEMPORAL_STORES) {
		printf("-F option supported only for -x1 and -x2\n");
		exit(1);
	}
	*/
	if (!user_cpulist_provided && runcpu == -1) // neither -k nor -c option provided
	{
		printf("Either -k or -c option should be provided\n");
		exit(1);
	}

	printf("instlat version 1.3e - Command line parameters: ");

	for (i = 1; i < argc ; i++) {
		printf("%s ", argv[i]);
	}

	printf("\n");
	BindToCpu(0);
	// calibrate to determine reference frequency (P1 freq)
	Calibrate (&ClksPerSec);
	if (runcpu != -1) { numcpus = 1; } // if -c is provided, then it is only one cpu

	tdp = (struct _tdData*) malloc(sizeof(struct _tdData)*numcpus);
	memset((char*)tdp, 0, sizeof(struct _tdData)*numcpus);
	if (instr_type == LARGE_STRIDE_LATENCY) {
		bufsize = offset * num_lines;
		//printf("bufsize = %lld, offset=%lld\n", bufsize, offset );
	}
	
	if (runcpu != -1) { // -c option specified
		tdp->cpuid = runcpu;
		tdp->mem_init_cpuid = (initmemcpu != -1)? initmemcpu:runcpu;
		tdp->src_size = bufsize;
		tdp->va_size = va_to_allocate;
		cpu_list[0] = runcpu;
	}
	else {
		tmp = tdp;
		for (i=0; i < numcpus; i++, tmp++)
		{
			tmp->cpuid = cpu_list[i];
			tmp->mem_init_cpuid = cpu_list[i];
			tmp->src_size = bufsize;
			tmp->va_size = va_to_allocate;
		}
	}

#ifdef LINUX	
	// create threads to allocate and initialize the memory
	for (i=0; i < numcpus; i++) {
		pthread_create(&td[i], NULL, (void*)mem_alloc_thread, (void*)&tdp[i]);
	}
	// wait for all threads to complete their mem allocations
	for (i=0; i < numcpus; i++) {
		pthread_join(td[i], NULL);
	}

	// create threads to execute the desired operations/instructions
	for (i=0; i < numcpus; i++) {
		pthread_create(&td[i], NULL, (void*)inst_exec_thread, (void*)&tdp[i]);
	}

	// wait for all threads to complete their executions
	for (i=0; i < numcpus; i++) {
		pthread_join(td[i], NULL);
	}
#else // windows version
	for (i=0; i < numcpus; i++) {
		td[i] = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)&mem_alloc_thread, (void*)&tdp[i], 0, &tId);
	}
	//wait for all threads to complete
	WaitForMultipleObjects( numcpus, td, TRUE, INFINITE);
	for (i=0; i < numcpus; i++) {
		td[i] = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)&inst_exec_thread, (void*)&tdp[i], 0, &tId);
	}
	WaitForMultipleObjects( numcpus, td, TRUE, INFINITE);
#endif

	if (instr_type == PAUSE || instr_type == FP_OPS || instr_type == BUSY_LOOP) print_latency_stats(tdp);
	else print_bw_stats(tdp);
	return 0;
}

void Usage(char * str )
{
	if (str) printf("%s\n", str);
	printf("Usage: \n./instlat -xn [-bn] [-cn] [-in] [-nn] [-kn] [-Jn] [-F] [-L]\n");
	printf("\t-x : specifies the type of instruction to be executed\n");
	printf("\t\t1 - Loads (movdqa to load cache lines)\n");
	printf("\t\t2 - Stores (movdqa to store cache lines)\n");
	printf("\t\t3 - Non Temporal stores (using movnti)\n");
	printf("\t\t4 - REP STOS\n");
	printf("\t\t5 - PAUSE\n");
	printf("\t\t6 - LOCK\n");
	printf("\t\t7 - CLWB\n");
	printf("\t\t8 - CLFLUSHOPT\n");
	printf("\t\t9 - FP operations\n");
	printf("\t\t10 - CLFLUSH latency\n");
	printf("\t\t11 - REP MOVSD memcpy\n");
	printf("\t\t12 - RFO memcpy\n");
	printf("\t\t13 - glibc memcpy\n");
	printf("\t\t14 - CLFLUSHOPT latency\n");
	printf("\t\t15 - Large Virt Addr alloc\n");
	printf("\t\t16 - Large stride latency\n");
	printf("\t\t17 - Useless prefetch\n");
	printf("\t\t18 - SW prefetch\n");
	printf("\t-b : buffer size in bytes - can use k,m,g to specify in KB/MB/GB (e.g -b200m)\n");
	printf("\t-c : specifies cpu# to pin the thread in case only one thread is used\n");
	printf("\t-i : specifies cpu# to pin where memory is allocated - used only if -c is specified\n");
	printf("\t-n : total number of cache lines accessed by each thread before test ends\n");
	printf("\t-k : Use this to specify a list of cpus if more than one is used\n");
	printf("\t\tspecify a list of cpu# (use '-' for range) e.g 3-6,9-13,19,20 \n");
	printf("\t-J : specifies DCPMEM persistent memory file system path from where memory will be allocated\n");
	printf("\t-F : CLFLUSHOPT will be executed after every load or store\n");
	printf("\t\tcan only be used in conjunction with -x1 or -x2\n");
	printf("\t-L : Allocate 2MB huge pages\n");
	printf("\t-H : Allocate 1GB huge pages\n");
	printf("\t-v : virtual address size to allocate\n");
	printf("\t-Y : Use AVX2 loads/stores\n");
	printf("\t-Y : Use AVX512 loads/stores\n");
	
	exit(1);
}
// All the buffers are allocated and then initialized
#ifdef LINUX
unsigned int mem_alloc_thread(void* p)
#else
UINT WINAPI mem_alloc_thread(PVOID p)
#endif
{
	struct _tdData *tdp;
	__int64 alloc_sz=0;
	
	tdp = (struct _tdData *)p;
	//printf("************** mem alloc *********\n");

	if(instr_type == PAUSE || instr_type == FP_OPS || instr_type == BUSY_LOOP) // no need to allocate any buffers
		return 0;
	BindToCpu (tdp->mem_init_cpuid);
	if (instr_type == LARGE_VA_ALLOC) {
		tdp->src_addr = reserve_address(tdp->va_size);
		setup_random_access (tdp->src_addr, tdp->va_size, tdp->src_size);
		return 0;
	}
		
	else if (instr_type == LARGE_STRIDE_LATENCY) {
		tdp->src_addr = reserve_address(tdp->src_size);
		setup_large_stride_access (tdp->src_addr, tdp->src_size, num_lines);
		return 0;
	}

	else if (instr_type == USELESS_PREF_TEST) {
		tdp->src_addr = reserve_address(tdp->src_size);
		setup_useless_pref_access (tdp->src_addr, tdp->src_size,  offset, num_lines);
		return 0;
	}

	else if (instr_type == PTR_CHASE_LATENCY) {
		tdp->src_addr = reserve_address(tdp->src_size);
		initialize_mem_for_ptr_chasing (tdp->src_addr, tdp->src_size);
		return 0;
	}

	else {
		if (tdp->src_size < 4096) alloc_sz = 4096; // smaller sizes were failing for some reason
		else alloc_sz = tdp->src_size;
		tdp->src_addr = allocate_memory(alloc_sz);
		if (tdp->src_size2) // if 2nd buffer is specified
			tdp->src_addr2 = allocate_memory(tdp->src_size2);
		if (instr_type == REPMOVS_MEMCPY || instr_type == MY_MEMCPY || instr_type == GLIBC_MEMCPY
			|| instr_type == LOAD_STORE_MIXED)
			tdp->src_addr2 = allocate_memory(alloc_sz);
		}
	return 0;
}

// Buffers are already allocated and initialized. Now, the desired instructions are executed using these buffers
#ifdef LINUX
unsigned int inst_exec_thread(void* p)
#else
UINT WINAPI inst_exec_thread(PVOID p)
#endif
{
	struct _tdData *tdp;
	__int64 start, end;
	__int64 start_opc=0, end_opc=0;
	
	tdp = (struct _tdData *)p;

	BindToCpu (tdp->cpuid);

	// record the start time and execute the selected instructions
	if (instr_type == CLFLUSHOPT_LATENCY) {
		// read the buffer once so it either gets cached or directory updated. Then, the
		// timing loop would focus on executing clflush alone
		load_data_prior_to_clflush(tdp->src_addr, tdp->src_size);
	}
	start = rdtsc();
#ifdef LINUX
	start_opc = get_msr_value(tdp->cpuid, 0xe8); // MSR 0xe8 gives cycles at current frequency
#endif
	switch (instr_type) 
	{
		case TEMPORAL_LOADS:
		{
			if (clflush)
				temporal_loads_clflush_instr (tdp->src_addr, tdp->src_size, iter);
			else {
				if (stride==64) {
					if (use_avx3)
						temporal_64B_avx3_loads_instr (tdp->src_addr, tdp->src_size, iter);
					else if (use_avx2)
						temporal_64B_avx2_loads_instr (tdp->src_addr, tdp->src_size, iter);
					else 						
						temporal_64B_sse2_loads_instr (tdp->src_addr, tdp->src_size, iter);
				}
				else {
					temporal_loads_instr (tdp->src_addr, tdp->src_size, iter);
				}
			}
			break;
		}
		case TEMPORAL_STORES:
		{
			if (clflush)
				temporal_stores_clflush_instr (tdp->src_addr, tdp->src_size, iter);
			else {
				if (stride==64) {
					if (use_avx3)
						temporal_64B_avx3_stores_instr (tdp->src_addr, tdp->src_size, iter);
					else if (use_avx2)
						temporal_64B_avx2_stores_instr (tdp->src_addr, tdp->src_size, iter);
					else 						
						temporal_64B_sse2_stores_instr (tdp->src_addr, tdp->src_size, iter);
				}
				else {
					temporal_stores_instr (tdp->src_addr, tdp->src_size, iter);
				}
			}
			break;
		}
		case MOVNTI:
		{
			movnti_instr (tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case REPSTOSB:
		{
			repsto_instr(tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case PAUSE:
		{
			pause_instr(iter);
			break;
		}
		case LOCK:
		{
			lock_instr(tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case RMW_CLWB: 
		{
			temporal_RMW_clwb_instr (tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case RMW_CLFLUSHOPT: 
		{
			temporal_RMW_clflush_instr (tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case FP_OPS:
		{
			fp_instr(iter);
			break;
		}
		case REPMOVS_MEMCPY:
		{
			repmov_instr(tdp->src_addr, tdp->src_addr2, tdp->src_size, iter);
			break;
		}
		case MY_MEMCPY:
		{
			my_memcpy(tdp->src_addr, tdp->src_addr2, tdp->src_size, iter);
			break;
		}
		case GLIBC_MEMCPY:
		{
			glibc_memcpy(tdp->src_addr, tdp->src_addr2, tdp->src_size, iter);
			break;
		}
		case CLFLUSHOPT_LATENCY:
		{
			clflush_instr_latency(tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case LARGE_VA_ALLOC:
		{
			do_specified_dependent_read((UINT64*)tdp->src_addr, iter);
			break;
		}
		case LARGE_STRIDE_LATENCY:
		{
			large_stride_latency_access(tdp->src_addr, iter);
			break;
		}
		case USELESS_PREF_TEST:
		{
			useless_prefetch_test(tdp->src_addr, iter);
			break;
		}
		case LOAD_STORE_MIXED:
		{
			load_store_mixed(tdp->src_addr, tdp->src_addr2, tdp->src_size, (__int64)ld_st_ratio, iter);
			break;
		}
		case SW_PREFETCH:
		{
			sw_prefetch_test(tdp->src_addr, tdp->src_size, num_lines, iter);
			break;
		}
		case PTR_CHASE_LATENCY:
		{
			dependent_read_latency(tdp->src_addr, tdp->src_size, iter);
			break;
		}
		case BUSY_LOOP:
		{
			do_busy_loop(iter);
			break;
		}
	}
	
#ifdef LINUX
	end_opc = get_msr_value(tdp->cpuid, 0xe8); // MSR 0xe8 gives cycles at current frequency
#endif
	end = rdtsc();
	tdp->total_cycles = end-start;
	tdp->total_operating_cycles = end_opc-start_opc;
	tdp->total_accessed = iter;
	return 0;
}

void print_bw_stats(struct _tdData *tdp)
{

#ifdef LINUX
#endif

	double latency, usec, mbytesPerSec, bytes_per_cycle=0;
	__int64 total_cycles=0, total_accessed=0, total_operating_cycles=0;
	int i;

#ifdef LINUX
	printf("cpu#\ttime(uS)    \tns/line\tMB/sec\tBytes/cycle\n");
#else
	printf("cpu#\ttime(uS)    \tns/line\tMB/sec\n");
#endif
	for (i=0; i < numcpus; i++, tdp++) {
		usec = (double)(tdp->total_cycles)*1000000/(double)ClksPerSec;
		if (instr_type == REPSTOSB || instr_type == REPMOVS_MEMCPY || instr_type == MY_MEMCPY || instr_type == GLIBC_MEMCPY) {
			latency = (double)usec*1000/(double)(iter*tdp->src_size/64);
			mbytesPerSec = (double)(iter*tdp->src_size)/usec;
			total_accessed+=(tdp->total_accessed * tdp->src_size/64);
		}
		else {
			latency = (double)usec*1000/(double)(iter);
			mbytesPerSec = (double)(iter*64)/usec;
			total_accessed+=tdp->total_accessed;
#ifdef LINUX
			bytes_per_cycle = ((double)iter*64) / (double)(tdp->total_operating_cycles);
#endif
		}
#ifdef LINUX
		printf("%d\t%.2f\t%.2f\t%.0f\t%.2f\n", cpu_list[i], usec, latency, mbytesPerSec, bytes_per_cycle );
#else
		printf("%d\t%.2f\t%.2f\t%.0f\n", cpu_list[i], usec, latency, mbytesPerSec);
#endif
		total_cycles+=tdp->total_cycles;
		total_operating_cycles+=tdp->total_operating_cycles;
		
	}
	total_cycles = total_cycles/numcpus; // average cycles
	usec = (double)(total_cycles)*1000000/(double)ClksPerSec;
	if (instr_type == REPSTOSB || instr_type == REPMOVS_MEMCPY || instr_type == MY_MEMCPY || instr_type == GLIBC_MEMCPY) {
		latency = (double)usec*1000/(double)(total_accessed/numcpus);
	} else {
		latency = (double)usec*1000/(double)iter;
	}
#ifdef LINUX
	bytes_per_cycle = ((double)total_accessed*64) / ((double)total_operating_cycles/numcpus);
#endif
	mbytesPerSec = (double)(total_accessed*64)/usec;
#ifdef LINUX
	printf("TOTAL\t%.2f\t%.2f\t%.0f\t%.2f\n", usec, latency, mbytesPerSec, bytes_per_cycle);
#else
	printf("TOTAL\t%.2f\t%.2f\t%.0f\n", usec, latency, mbytesPerSec);
#endif

}

void print_latency_stats(struct _tdData *tdp)
{
	double latency, usec;
	__int64 total_cycles=0, total_accessed;
	int i;
	
	printf("cpu#\ttime(uS)    \tns/line\n");
	for (i=0; i < numcpus; i++, tdp++) {
		usec = (double)(tdp->total_cycles)*1000000/(double)ClksPerSec;
		latency = (double)usec*1000/(double)iter;
		printf("%d\t%.2f\t%.2f\t\n", cpu_list[i], usec, latency);
		total_cycles+=tdp->total_cycles;
		total_accessed+=tdp->total_accessed;
		
	}
	total_cycles = total_cycles/numcpus; // average cycles
	usec = (double)(total_cycles)*1000000/(double)ClksPerSec;
	latency = (double)usec*1000/(double)iter;
	printf("TOTAL\t%.2f\t%.2f\n", usec, latency);

}
