#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include <assert.h>

const char* getVectorPrefix(const char * type) {
   if (!strcmp("Integer", type))
     return "Int";
   return type;
}

const char* getCastType(int masklen) {
  switch(masklen) {
    case 1:
      return "0x1L";
    case 2:
      return "0x3L";
    case 4:
      return "0xFL";
    case 8:
      return "0xFFL";
    case 16:
      return "0xFFFFL";
    case 32:
      return "0xFFFFFFFFL";
    case 64:
      return "-1L"; 
    default:
      assert(0);
      return "";
  }
}

void printTest(const char * dst_type, int dst_size, int masklen) {
  fprintf(stdout,"public static void test%s%d(long val) {\n", dst_type, dst_size);
  fprintf(stdout,"    VectorSpecies<%s> SPECIES = %sVector.SPECIES_%d;\n",dst_type, getVectorPrefix(dst_type), dst_size);
  fprintf(stdout,"    VectorMask<%s> mask = VectorMask.fromLong(SPECIES, val);\n", dst_type);
  fprintf(stdout,"    Assert.assertEquals(mask.toLong(), val & %s);\n",getCastType(masklen));
  fprintf(stdout,"}\n\n");
}

void printMicro(const char * dst_type, int dst_size, int masklen) {
  fprintf(stdout,"@Benchmark\n");
  fprintf(stdout,"public VectorMask<%s> microLongToMask%s%d() {\n", dst_type, dst_type, dst_size);
  fprintf(stdout,"    return VectorMask.fromLong(%sVector.SPECIES_%d, lval);\n", getVectorPrefix(dst_type), dst_size );
  fprintf(stdout,"}\n\n");
}

int main() {
  char * types[] = {"Byte","Short","Integer", "Long", "Float", "Double"};
  int  sizes[] = {64, 128, 256, 512};
  int  tsize[] = {8, 16, 32, 64, 32, 64};

  for(int st = 0; st < 6; st++) {
    for(int ss = 0; ss < 4; ss++) {
       //printTest(types[st], sizes[ss], sizes[ss]/tsize[st]);
       printMicro(types[st], sizes[ss], sizes[ss]/tsize[st]);
    }
  }
  return 0;
}
