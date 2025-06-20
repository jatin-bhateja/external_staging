#include "common.h"

#ifdef LINUX
int BindToCpu(int cpu_num)
{
        long status;

    cpu_set_t cs;

    CPU_ZERO (&cs);
    CPU_SET (cpu_num, &cs);
    status = sched_setaffinity (0, sizeof(cs), &cs);
    if (status < 0) {
        printf ("Error: unable to bind thread to core %d\n", cpu_num);
        exit(1);
        }
        return 1;
}
#else
int GetNumberOfCpus();

typedef DWORD_PTR (WINAPI *LPFN_SetThreadGroupAffinity)(HANDLE, GROUP_AFFINITY *, GROUP_AFFINITY *);
typedef WORD (WINAPI *LPFN_GetActiveProcessorGroupCount)(VOID);
typedef DWORD (WINAPI *LPFN_GetActiveProcessorCount)(WORD);

static LPFN_SetThreadGroupAffinity pSTGA;
static LPFN_GetActiveProcessorGroupCount pGAPGC;
static LPFN_GetActiveProcessorCount pGAPC;
static int winver_identified=0;
static int more_than_64_cpus=0; 
static int groupCnt;
static int groupArray[16];
static int total_cpu_cnt = -1;

int BindToCpu(int cpuid)
{
	int idx, i, groupId, groupCpuid;
	GROUP_AFFINITY ga, oldga;
	UINT64 affinity;
	DWORD_PTR st;
	int success=0;

	affinity=1;

	if (!winver_identified)
	{
		GetNumberOfCpus();
	}
	if (more_than_64_cpus)
	{
		idx = cpuid+1;
		//printf ("idx=%d\n", idx);
	   //printf(">64 grpcnt=%d, groupa values %d, %d, %d\n", groupCnt, groupArray[0],groupArray[1],groupArray[2]);
		for (i=0; i < groupCnt; i++)
		{
			if ( idx <= groupArray[i])
			{
				groupId=i;
				if (i > 0)
					groupCpuid = cpuid - groupArray[i-1];
				else
					groupCpuid = cpuid;
				break;
			}
		}

		if (groupArray[i] == 0) {printf("wrong cpuid %d, grouparray id %d\n", cpuid, i); }
		else
		{
			affinity <<= groupCpuid;
			ga.Mask = affinity;
			ga.Group = groupId;
			ga.Reserved[0]=0;ga.Reserved[1]=0;ga.Reserved[2]=0; // reserved fields must be set to zero
			//printf("mask=%I64x, id=%d\n", ga.Mask, ga.Group);
			st = pSTGA(GetCurrentThread(), &ga, &oldga);
			if (!st)
			{
				printf("win7 --Unable to bind to cpu %d; Getlasterror_in_decimal=%d; status=%I64d\n", cpuid, GetLastError(), st);
			}
			else success=1;
		}
	}
	else
	{ // regular method of binding threads to be followed
		affinity=1;
		affinity<<=cpuid;
		st = SetThreadAffinityMask(GetCurrentThread(), affinity);
		if (!st && GetLastError()!=0)
		{
			printf("Unable to bind to cpu %d; Getlasterror_in_decimal=%d; status=%I64d\n", cpuid, GetLastError(), st);
		}
		else success=1;

	}
	return success;

}

int GetNumberOfCpus()
{
	int idx, i, groupId, groupCpuid;
	GROUP_AFFINITY ga, oldga;
	UINT64 affinity;
	DWORD_PTR st;
	int success=0;

	affinity=1;
	//printf("bindto cpu %d\n", cpuid);

	if (!winver_identified)
	{
		pGAPGC = (LPFN_GetActiveProcessorGroupCount) GetProcAddress(
			GetModuleHandle(TEXT("kernel32.dll")), 
			"GetActiveProcessorGroupCount");
		winver_identified=1;
	   if(NULL != pGAPGC)
	   {
		  groupCnt = pGAPGC();
		  if (groupCnt > 1 )
		  {
			  // we can assume that this system supports > 64 cpus
				total_cpu_cnt=0;
				more_than_64_cpus=1;
				pGAPC = (LPFN_GetActiveProcessorCount) GetProcAddress(
				GetModuleHandle(TEXT("kernel32.dll")), 
				"GetActiveProcessorCount");
				if(NULL != pGAPC)
				{
				  for (i=0; i < groupCnt; i++)
				  {
					groupArray[i] = pGAPC(i);
					total_cpu_cnt += groupArray[i];
					//printf ("grp[%d] cnt=%d\n", i, groupArray[i]);
					if (i!=0) groupArray[i] += groupArray[i-1];

				  }
				}
				//printf("Grpcnt=%d, Grouparray %d, %d, %d\n", groupCnt, groupArray[0], groupArray[1], groupArray[2]);
				fflush(stdout);
				pSTGA = (LPFN_SetThreadGroupAffinity) GetProcAddress(
				GetModuleHandle(TEXT("kernel32.dll")), 
				"SetThreadGroupAffinity");
		  }
	   }
	   if (total_cpu_cnt == -1)
	   {
		   if (more_than_64_cpus == 0 || groupCnt <=1)
		   {
			   SYSTEM_INFO		g_si;	// System Information structure
		   		GetSystemInfo(&g_si);
				total_cpu_cnt = g_si.dwNumberOfProcessors;;

		   }
	   }
	   //printf("groupa values %d, %d, %d\n", groupArray[0],groupArray[1],groupArray[2]);
	}
   return total_cpu_cnt;

}
#endif

