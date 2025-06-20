#include "stdio.h"
#include "string.h"
#include "assert.h"
#include "stdint.h"

enum {
  T_BYTE, T_SHORT, T_INT, T_LONG, T_FLOAT, T_DOUBLE
};

const char* getVecTypeStr(int type) {
   switch(type) {
     case T_BYTE: return "Byte";
     case T_SHORT: return "Short";
     case T_INT: return "Integer";
     case T_LONG: return "Long";
     case T_FLOAT: return "Float";
     case T_DOUBLE: return "Double";
     default: assert(0);
   }
}

const char * getVecSizeStr(int size) {
   assert(size >= 128 || size <= 512);
   const char * size_arr[] =  {"", "128", "256", "", "512"};
   return size_arr[size >> 7];
}

const char* getVecTypePrefix(int type) {
   if (type == T_INT)
     return "Int";
   return getVecTypeStr(type);
}

const char* getArrName(int type) {
   switch(type) {
     case T_BYTE: return "byte";
     case T_SHORT: return "short";
     case T_INT: return "int";
     case T_LONG: return "long";
     case T_FLOAT: return "float";
     case T_DOUBLE: return "double";
     default: assert(0);
   }
}

const char* getReinterpretType(int type) {
   switch(type) {
     case T_BYTE: return "Bytes";
     case T_SHORT: return "Shorts";
     case T_INT: return "Ints";
     case T_LONG: return "Longs";
     default: assert(0);
   }
}

char* getConvOper(int stype, int dtype) {
   static char conv_op[4]; 
   char src_type_desc = getVecTypeStr(stype)[0];
   char dst_type_desc = getVecTypeStr(dtype)[0];
   sprintf(conv_op, "%c2%c", src_type_desc, dst_type_desc);
   return conv_op;
}

int getLaneCount(int type, int bit_size) {
  int size = -1;
  switch(type) {
    case T_FLOAT:
    case T_INT:
       size = 32; break;
    case T_LONG:
    case T_DOUBLE:
       size = 64; break;
    case T_SHORT:
       size = 16; break;
    case T_BYTE:
       size = 8; break;
    default:
       assert(0);
  }
  return bit_size/size;
}

void printBM(int src_type, int dst_type, int src_bit_size, int dst_bit_size) {
   const char * src_type_str = getVecTypeStr(src_type);
   const char * dst_type_str = getVecTypeStr(dst_type);
   const char * src_size_str = getVecSizeStr(src_bit_size);
   const char * dst_size_str = getVecSizeStr(dst_bit_size);
   const char * src_vec_type_prefix = getVecTypePrefix(src_type);
   const char * dst_vec_type_prefix = getVecTypePrefix(dst_type);
   const char * src_arr_name = getArrName(src_type);
   const char * dst_arr_name = getArrName(dst_type);
   const char * dst_type_reinterpret_str = getReinterpretType(dst_type);
   fprintf(stdout,"\n@Benchmark\n");
   fprintf(stdout,"public void two%sTablePerm%s() {\n", src_type_str, src_size_str, dst_type_str, dst_size_str);
   fprintf(stdout,"    VectorSpecies<%s> ISPECIES = %sVector.SPECIES_%s;\n", src_type_str, src_vec_type_prefix, src_size_str);
   fprintf(stdout,"    VectorSpecies<%s> OSPECIES = %sVector.SPECIES_%s;\n", dst_type_str, dst_vec_type_prefix, dst_size_str);
   int src_lanes = getLaneCount(src_type, src_bit_size); 
   int dst_lanes = getLaneCount(dst_type, dst_bit_size); 
   if (dst_lanes > src_lanes) {
     fprintf(stdout,"    for (int i = 0, j = 0; i < ISPECIES.loopBound(SIZE / %d); i += ISPECIES.length(), j += OSPECIES.length()) {\n", dst_lanes/src_lanes);
   } else {
     fprintf(stdout,"    for (int i = 0, j = 0; i < ISPECIES.loopBound(SIZE); i += ISPECIES.length(), j += OSPECIES.length()) {\n");
   }
   fprintf(stdout,"        %sVector.fromArray(ISPECIES, %s_arr, i)\n", src_vec_type_prefix, src_arr_name);
   fprintf(stdout,"            .convertShape(VectorOperators.%s, OSPECIES, 0)\n", getConvOper(src_type, dst_type));
   fprintf(stdout,"            .reinterpretAs%s()\n", dst_type_reinterpret_str);
   fprintf(stdout,"            .intoArray(%s_res, j);\n", dst_arr_name);
   fprintf(stdout,"    }\n");
   fprintf(stdout,"}\n");
}

int main() {
  int  ssizes[] = {128, 256};
  int  dsizes[] = {128, 256, 512};
  int  stypes[] = {T_FLOAT, T_DOUBLE};
  int  dtypes[] = {T_BYTE, T_SHORT, T_INT, T_LONG};
  for(int st = 0; st < sizeof(stypes)/sizeof(int); st++) {
    for(int ss = 0; ss < sizeof(ssizes)/sizeof(int); ss++) {
      for(int dt = 0; dt < sizeof(dtypes)/sizeof(int); dt++) {
        for(int ds = 0; ds < sizeof(dsizes)/sizeof(int); ds++) {
           printBM(stypes[st], dtypes[dt], ssizes[ss], dsizes[ds]);
        }
      }
    }
  }
  return 0;
}
