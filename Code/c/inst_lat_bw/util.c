#include "common.h"

int* rand_array;
__int64 getActualLenToAllocate(__int64 len);

#ifdef LINUX
static inline unsigned long long int GetTickCount()
{
        struct timeval tp;
        gettimeofday(&tp,NULL);
        return tp.tv_sec*1000+tp.tv_usec/1000;
}
#endif

char *allocate_memory(__int64 len)
{
	char *buf=NULL;
	__int64 actual_len;
	
	// We need to add some extra padding as most of the throughput generation routines have multiple line loads/stores
	// so to make sure we don't go past the allocated length, it is safer to add 8 more lines to the requested size
	actual_len = getActualLenToAllocate(len);
	buf = pmem_allocation ? allocate_pmem(pmem_path, actual_len) : reserve_address (actual_len);
	if (buf != NULL)
		touch_buffer(buf, len); // don't need to initialize the extra length allocated. Just VA allocation is enough
	return buf;
}

char * reserve_address(__int64 len)
{
	char *buf=NULL;
	__int64 page2m=2*1024*1024;
	__int64 page1g=1*1024*1024*1024LL;
	
#ifdef LINUX
	if (lp_1GB_enabled) {
		if ((len % page1g) !=0)
		{
			// round it up to a multiple of 1GB page size
			len = ((len / page1g) + 1) * page1g;
		}
		buf= (char *)mmap(0,len,PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_NORESERVE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_1GB,0, 0);

	}
	else if (lp_enabled) { // only 2MB huge pages requested
		if ((len % page2m) !=0)
		{
			// round it up to a multiple of 2M page size
			len = ((len / page2m) + 1) * page2m;
		}
		buf = (char*)mmap(0, len, PROT_READ | PROT_WRITE , MAP_PRIVATE | MAP_NORESERVE | MAP_ANONYMOUS | MAP_HUGETLB, 0, 0);
	} else {
		buf = (char*)mmap(0, len, PROT_READ | PROT_WRITE , MAP_PRIVATE | MAP_NORESERVE | MAP_ANONYMOUS, 0, 0);
	}

#else
	if (lp_enabled) {
		__int64 num_pages=0;
		num_pages = (len / GetLargePageMinimum()) + 1;
		buf = (char*)VirtualAlloc(NULL, num_pages * GetLargePageMinimum(), MEM_COMMIT | MEM_LARGE_PAGES, PAGE_READWRITE);
	} else {
		if (instr_type == LARGE_VA_ALLOC)
			// since it is a large alloc and physical memory does not exist, only reserve and commit later on demand
			buf = (char*)VirtualAlloc(0, len, MEM_RESERVE, PAGE_READWRITE);
		else
			buf = (char*)VirtualAlloc(0, len, MEM_COMMIT, PAGE_READWRITE);
	}
	if (buf == NULL) {
		printf("Buffer allocation failed!\n");
		exit(1);
	}
#endif
//printf("aloocated add=%llx\n", buf);
	return buf;

}

// Initialize the memory so that the memory is allocated on the local node in case of NUMA systems
void touch_buffer(char* buf, __int64 len)
{
	__int64 i, *ptr;

	// write non-zero values and possibly unique so kernel won't merge similar pages
	ptr = (__int64*)buf;
	for (i = 0; i < len / 8; i++) {
		ptr[i] = i;
	}
}

// Get P1 freq
void Calibrate(UINT64   *ClksPerSec)
{
        UINT64  start;
        UINT64  end;
        UINT64  diff;

        unsigned long long int  starttick, endtick;
        unsigned long long int  tickdiff;

        endtick = GetTickCount();

        while(endtick == (starttick=GetTickCount()) );

	start = rdtsc();
        while((endtick=GetTickCount())  < (starttick + 500));
        end = rdtsc();
        //      printf("start tick=%llu, end tick=%llu\n",starttick,endtick);

        diff = end - start;
        tickdiff = endtick - starttick;
        //      printf("end=%llu,start=%llu,diff=%llu\n",end,start,diff);
        *ClksPerSec = ( diff * (UINT64)1000 )/ (unsigned long long int)(tickdiff);
        NsecClk = (double)1000000000 / (double)(__int64)*ClksPerSec;
        //printf("P1 freq = %d MHz\n",*ClksPerSec/1000000);
}

void print_latency(char *type, __int64 delta, __int64 iter)
{
	double latency, usec;

	usec = (double)(delta)*1000000/(double)ClksPerSec;
	latency = (double)usec*1000/(double)iter;
	printf("%s: %.3f usec to complete %lld executions at %.2f nsec per execution \n", type, usec,  iter, latency );

}


void print_bandwidth(char *type, __int64 delta, __int64 iter, __int64 bufsize)
{
	double latency, usec, mbytesPerSec;

	usec = (double)(delta)*1000000/(double)ClksPerSec;
	latency = (double)usec*1000/(double)iter;
	if (strcmp(type, "REP stosb") == 0)
		mbytesPerSec = (double)(iter*bufsize)/usec;
	else
		mbytesPerSec = (double)(iter*64)/usec;
	printf("%s: %.3f usec to complete %lld executions @%.2f nsec/execution and at a rate of %.0f MBytes/sec\n", type, usec,  iter, latency, mbytesPerSec );
}

__int64 parse_number(char *str)
{
	char tmp[64];
	int i;
	__int64 multiplier=1, val=0;
	
	strcpy(tmp, str);
	for (i=0; i < strlen(tmp); i++) {
		if (tmp[i] == 'G' || tmp[i] == 'g') {
			tmp[i] = 0;
			multiplier = (__int64)1024*1024*1024;
			break;
		}
		if (tmp[i] == 'M' || tmp[i] == 'm') {
			tmp[i] = 0;
			multiplier = (__int64)1024*1024;
			break;
		}
		if (tmp[i] == 'K' || tmp[i] == 'k') {
			tmp[i] = 0;
			multiplier = (__int64)1024;
			break;
		}
	}
	val = atol(tmp);
	val *= multiplier;
	return val;
}

char *allocate_pmem(char *sxp_path, __int64 len)
{
#ifdef LINUX
	int mmap_pathlen, fd;
	static char template[] = "/vmem.XXXXXX";
	char *buf;
	
	mmap_pathlen = strlen(sxp_path);
	char fullname[mmap_pathlen + sizeof(template)];
	(void)strncpy(fullname, sxp_path, mmap_pathlen+1);
	(void)strcat(fullname, template);

	if( (fd = mkstemp(fullname)) < 0 ){
		fprintf(stderr, "Path: %s\n", fullname);
		perror("mkstemp");
		// "Failed to create file, check if --mdir value is correct, mkstemp error\n");
	}

	(void)unlink(fullname);
	if( posix_fallocate(fd, 0, len) ){
		(void)close(fd);
		perror("posix_fallocate");
		exit(1);
	}
	
	buf = (char*)mmap(0, len, PROT_READ | PROT_WRITE , MAP_SHARED, fd, 0);
	if (buf == NULL) {
		printf("Unable to allocate memory in %s\n", sxp_path);
		exit(1);
	}
	return buf;
#else
	return NULL;
#endif

}

void parse_user_cpulist(char *list)
{
	int i, num, from, to;
	char *p, *tmp;
	char buf[256];

	strncpy(buf, list, sizeof(buf));
	if (!check_for_valid_chars_in_cpu_range(buf)) {
		printf("Invalid characters in cpu_range in -k option\n");
		exit(0);
	}
	p=buf;
	numcpus=0;
	while(p) {
		tmp = p;
		p = strchr(p, ',');
		if (p != NULL)  
			*p++='\0';
		// tmp contains substr which may contain '-'
		if (strchr(tmp, '-')) { // contains '-'
			sscanf(tmp, "%d-%d", &from, &to);
			if (from > to) {
				printf("In cpu range (-k option) field, %d > %d\n", from, to);
				exit(0);
			}
			for (i=from; i <= to; i++) {
				if (i > os_cpu_count-1) { printf("Invalid cpu id %d on -k parameter list\n", i); exit(0); }
				cpu_list[numcpus] = i;
				numcpus++;
			}
		} else { // single number
			sscanf(tmp, "%d", &num);
			cpu_list[numcpus] = num;
			if (num > os_cpu_count-1 || num < 0) { printf("Invalid cpu id %d on -k parameter list\n", num);exit(0); }
			numcpus++;
		}
	}
}

int check_for_valid_chars_in_cpu_range(char *s)
{
	while (*s) {
		// check for only '-', ',' and digits 0-9
		if ( !(*s=='-' || *s==',' || (*s>='0' && *s<='9'))) return 0;
		s++;
	}
	return 1;
}

__int64 init_va_range (__int64 va_to_allocate, __int64 n_lines)
{
	char *buf;
	//__int64 stride = 64;
	
	buf = reserve_address(va_to_allocate);
	if (buf == NULL) {
		printf("Unable to allocate buffer of size %lld\n", va_to_allocate);
		exit(0);
	}
	return 0;
}

#ifdef LINUX
unsigned long long get_physaddr(void *vaddr)
{
        unsigned long long addr;
        //static int idx=0;
	static int pagemap_fd=-1;
	if (pagemap_fd) {
		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
	}
        int n = pread(pagemap_fd, &addr, 8, ((unsigned long long)vaddr / 4096) * 8);
        if (n != 8)
                return 0;
        if (!(addr & (1ULL<<63)))
                return 0;
        addr &= (1ULL<<54)-1;
        addr <<= 12;
        return addr + ((unsigned long long)vaddr  & (4096-1));
}
#endif
#ifndef LINUX
int win_rand()
{
	int number=0;
	__asm {
		xor rax, rax
		retry:
			rdrand eax
			jc gotone
			pause
			jmp retry
		gotone:
			and eax, 07fffffffh ; lose bit 31 so it is not a negative number
			mov number, eax
		}
		return number;
}
#endif

unsigned int generate_random_number() 
{
#if defined(LINUX) || defined(__APPLE__)
	return rand();
#else
	// in windows rand() function only returns a max of 32K. SO, we will use h.w random generator if it is available
	return win_rand();
#endif
}


// Get a bunch of random numbers
void populate_rand_array(int *rand_array, int max_size)
{
	unsigned int r, idx, cnt = 0, rand_size;
	char *dup_array;
	
	// dup_array is used to detect whether a number from rand() is a duplicate; 1 indicates seen already
	if (max_size <=0) return;
	dup_array = (char*)malloc(max_size+1);
	//assert(dup_array);
	memset(dup_array, 0, max_size+1);
	memset(rand_array, 0, sizeof(int)*max_size);
	rand_size = max_size;
	idx = 0;

	for (;;) {
		for (;;) {
#if defined(LINUX) || defined(__APPLE__)
			r = rand() % rand_size;
#else
			r = generate_random_number() % rand_size;
#endif
			if (r!=0 && dup_array[r] == 0) { // should not be zero and not used already
				break;
			}
		}

		if (rand_array[idx] == 0 && idx != r) { // if entry not used and value won't point to itself, then go ahead
			rand_array[idx] = r;
			idx = r;
			dup_array[r]=1;
			cnt++;
		}

		if (cnt >= max_size-1) { // if you reached all but one, then bail out
			rand_array[idx] = max_size;
			break;
		}
	}

	free(dup_array);
 }

// Initialize the entire buffer with random patterns
// Each line points to another line randomly selected and the tail points to the
// head so that the traversal can loop back
void Create_random_pattern(UINT64** buf, __int64 size)
{
	UINT64 num_blocks, i, j;
	UINT64** p, **end_idx=NULL, **blk_start;
	int saved_LineSize, max_cache_lines;

	saved_LineSize = stride;
	if (Random_Access) {
		srand((unsigned)time(NULL));
		rand_array = (int*)malloc(max_rand_size*sizeof(int));
		populate_rand_array(rand_array, max_rand_size);
	}
	
	max_cache_lines = max_rand_size;
	num_blocks = size / (max_rand_size * stride);
	if (num_blocks <=0) { // the buffer size is too small. Reduce the max_cache_lines to fit
		max_cache_lines = size/stride;
		num_blocks=1;
		populate_rand_array(rand_array, max_cache_lines);
	}
	p = buf;

	for (i = 0; i < num_blocks; i++) {
		blk_start = p;

		for (j = 0; j < max_cache_lines; j++) {
			if (rand_array[j] == max_cache_lines) {
				end_idx = p;
			}

			*p = (__int64*)(blk_start + (rand_array[j] * (stride / sizeof(__int64*))));
			p += (stride / sizeof(__int64*)); // move to next cache line
		}
	}

	if (end_idx) *end_idx = (__int64*)buf;
	// restore the line size
	stride = saved_LineSize;
	
}

void do_64B_reads(char* buf, __int64 len)
{
#if defined(LINUX) || defined(__APPLE__)
	asm volatile(
		"xor %0, %0\n\t"
		"LOOPS_read1:\n\t"
		"movdqa (%1), %%xmm0 \n\t"
		"add $0x40, %1 \n\t"
		"add $0x40, %0 \n\t"
		"cmp %2,%0\n\t"
		"jl LOOPS_read1 \n\t"
		::"r"(0LL),"r"(buf),"r"(len));
#else
	__asm {
		//zero out COUNTER and initialize arrayPOSITION
		xor rbx, rbx
		mov rdx, buf
		mov r8, len

		LOOP_read:
		//load value in [arrayPOSITION] into arrayPOSITION
		// basically pointer chasing code
		movdqa xmm0, [rdx]
		add rdx, 40h
		add rbx, 40h
		cmp rbx, r8

		//quit if loop has run allotted number of times
		jb LOOP_read
	}

#endif
}

/* Evict the specified cache line from all levels */
#if defined(LINUX) || defined(__APPLE__)
void evict_line_from_cache(volatile void *ptr)
{
    asm volatile ("clflush (%0)" :: "r"(ptr));
}
#else
void evict_line_from_cache(volatile void *ptr)
{
	__asm {
		clflush [rcx]
		}
}
#endif

#if defined(LINUX)
void do_busy_loop(__int64 iter)
{
	asm (
		"xor %2, %2\n\t"
		"LOOP_bloop:\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"xor %1, %1\n\t"
		"add $0x64, %2\n\t"
		"cmp %0, %2\n\t"
		"jb LOOP_bloop\n\t"
		::"r"(iter), "r"(0L), "r"(0L): );

}
#else
void do_busy_loop(__int64 iter)
{	
	__asm {
		//zero out COUNTER and initialize arrayPOSITION
		xor r8, r8
		mov rcx, iter


		exec_loop:
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		xor rdx, rdx
		add r8, 100
		cmp r8, rcx

		//quit if loop has run allotted number of times
		jb exec_loop
	}

}
#endif


#ifdef LINUX
UINT64 read_msr(char * msrDevPName, int msrNum, UINT64 msrValue) {

	int fh;
	off_t fpos;
	ssize_t countBy;

	if ((fh= open(msrDevPName,O_RDWR))<0) {
		fprintf(stderr,"open(\"%s\",...) failed\n",msrDevPName);
		fprintf(stderr, "Either msr module is not loaded or running without root privilege\n");
		fprintf(stderr, "Execute modprobe msr to load msr module if needed\n");
		exit(1);
	}
	if ((fpos= lseek(fh,msrNum,SEEK_SET)),0) {
		perror("lseek() failed"); 
		exit(1);
	}
	if ((countBy= read(fh,&msrValue,sizeof(msrValue)))<0) {
		perror("read() failed");
		exit(1);
	}
	else if (countBy!=sizeof(msrValue)) {
		fprintf(stderr,"attempt to read(8-bytes) got %zd bytes\n",countBy);
		exit(1);
	}
	return msrValue;
}

UINT64 write_msr(char * msrDevPName, int msrNum, UINT64 msrValue) {

	int fh;
	off_t fpos;
	ssize_t countBy;

	if ((fh= open(msrDevPName,O_RDWR))<0) {
		fprintf(stderr,"open(\"%s\",...) failed\n",msrDevPName);
		exit(1);
	}
	if ((fpos= lseek(fh,msrNum,SEEK_SET)),0) {
			perror("lseek() failed"); exit(1);
	}
	if ((countBy= write(fh,&msrValue,sizeof(msrValue)))<0) {
		perror("write() failed");
		exit(1);
	}
	else if (countBy!=sizeof(msrValue)) {
		fprintf(stderr,"attempt to write(8-bytes) got %zd bytes\n",countBy);
		exit(1);
	}
	return msrValue;
}

UINT64 get_msr_value(int cpu, int msrNum)
{
	char msrDevPName[1024];
	UINT64 msrValue;
	
	snprintf(msrDevPName,sizeof(msrDevPName)-1,"/dev/cpu/%d/msr",cpu);
	msrValue = read_msr(msrDevPName, msrNum, msrValue);
	return msrValue;
}

#endif

__int64 getActualLenToAllocate(__int64 len)
{
	__int64 page2m=2*1024*1024;
	__int64 page1g=1*1024*1024*1024LL;
	__int64 padding;
	
	// We need to add some extra padding as most of the throughput generation routines have multiple line loads/stores
	// so to make sure we don't go past the allocated length, it is safer to add 8 more lines to the requested size
	padding = stride * 8; 
	len += padding;
	if (lp_1GB_enabled && (len % page1g) != 0)
		len = ((len / page1g) + 1) * page1g;
	else if (lp_enabled && (len % page2m) !=0) // 2MB pages requested
		len = ((len / page2m) + 1) * page2m;
	return len;
	
}
