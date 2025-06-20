#include <sys/mman.h>
#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>
#include <time.h>

#define NUM_2M_PAGES 10
#define MAP_HUGE_2MB    (21 << MAP_HUGE_SHIFT)
#define PAGE_SIZE 2097152L

uint64_t total_memory = NUM_2M_PAGES*PAGE_SIZE;

void reserve_memory()
{
     int flags1 = MAP_PRIVATE|MAP_ANONYMOUS;
     int flags2 = MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB|MAP_HUGE_2MB;
     char* start  = mmap(NULL, total_memory, PROT_NONE, flags1, -1, 0);
     if(start == MAP_FAILED){
        //Unmapping pages if sanity check fails
        fprintf(stdout,"Reserved Mapping Failed\n");
     }
     fprintf(stdout,"Reservation passed!\n");
     char cr = getchar();

     start  = mmap(start, total_memory, PROT_READ|PROT_WRITE, flags2, -1, 0);
     if(start == MAP_FAILED){
        //Unmapping pages if sanity check fails
        fprintf(stdout,"Mapping Failed\n");
     }
     fprintf(stdout,"Commit passed!\n");
     cr = getchar();
     //munmap(start, total_memory);
}

int main(char* args[])
{
    int prot = PROT_READ|PROT_WRITE;
    fprintf(stdout,"Setup Complete\n");   
    for(int i=0 ;i<5;i++) {
      reserve_memory();
    }
    return 0;
}
