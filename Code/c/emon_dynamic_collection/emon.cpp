
#include "emon_api.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <chrono>

#define MSG(...) \
 fprintf(stderr, __VA_ARGS__)

class EMONCollector {
 public:
   static bool start() {
     if (EMONConfig("emon_api_config_file.xml")) {
       MSG("EMON configuration failure\n");
       return false;
     }
     if (EMONStart()) {
       MSG("EMON starting failure\n");
       return false;
     }
     MSG("EMON collection starting failure!\n");
     if (EMONPause()) {
       MSG("EMON pausing failure\n");
       return false;
     }
     EMONPause();
     return true;
   }
   EMONCollector() {
     if(EMONResume()) {
       MSG("EMON collection resumption failed!\n");
     }
   }
   ~EMONCollector() {
     if(EMONStop()) {
       MSG("EMON collection stopage failed!\n");
     }
   }
};

void GC_Epoc(int time, int * heap, int size) {
  MSG("GC[%d] : Collection Started \n", time);
  EMONCollector obj;
  int iter = 0;
  for(int i = 0; i < size; i++) {
    int src = rand() % size;
    heap[i] = heap[src];
  }
  MSG("GC[%d] : Collection End \n", time);
}

int main(int argc, char * argv[]) {
  if (argc != 2) {
    MSG("./collector <HEAP_SIZE>\n");
    return -1;
  }
  int gc = 0;
  int size = atoi(argv[0]);
  int * heap = new int[size];
  memset(heap, 10, sizeof(size*4));
  if(EMONCollector::start()) {
    for(int i = 0; i < 1000000; i++) {
       if ((i & 1023) == 0) {
          GC_Epoc(gc++, heap, size);
       }
    } 
  }
}
