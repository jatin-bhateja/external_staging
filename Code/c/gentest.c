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

void printBM(int src_type, int dst_type, int bit_size) {
   const char * src_type_str = getVecTypeStr(src_type);
   const char * dst_type_str = getVecTypeStr(dst_type);
   const char * src_size_str = getVecSizeStr(bit_size);
   const char * src_vec_type_prefix = getVecTypePrefix(src_type);
   const char * dst_vec_type_prefix = getVecTypePrefix(dst_type);
   const char * src_arr_name = getArrName(src_type);
   const char * dst_arr_name = getArrName(dst_type);
   const char * dst_type_reinterpret_str = getReinterpretType(dst_type);
   fprintf(stdout, "@Test\n");
   fprintf(stdout, "@IR(counts = {IRNode.VECTOR_CAST_%c2X, \"> 0\"})\n", getVecTypeStr(src_type)[0]);
   fprintf(stdout, "public void %s2%s%d() {\n", getArrName(src_type), getArrName(dst_type), bit_size);
   fprintf(stdout, "   for(int i = 0, j = 0; i < %s_arr.length; i+=%cspec%d.length(), j+=%cspec%d.length()) {\n", getArrName(src_type), getArrName(src_type)[0], bit_size, getArrName(dst_type)[0], bit_size);
   fprintf(stdout, "       %sVector vec = %sVector.fromArray(%cspec%d, %s_arr, i);\n", getVecTypePrefix(src_type), getVecTypePrefix(src_type), getArrName(src_type)[0], bit_size, getArrName(src_type));
   fprintf(stdout, "       vec.convertShape(VectorOperators.%c2%c, %cspec%d, 0)\n", getVecTypePrefix(src_type)[0], getVecTypePrefix(dst_type)[0], getArrName(dst_type)[0], bit_size);
   fprintf(stdout, "          .reinterpretAs%s()\n", getReinterpretType(dst_type));
   fprintf(stdout, "          .intoArray(%s_arr, j);\n", getArrName(dst_type));
   fprintf(stdout, "       check%c2%s(i, Integer.min(vec.length(), %cspec%d.length()));\n", getArrName(src_type)[0], getArrName(dst_type), getArrName(dst_type)[0], bit_size);
   fprintf(stdout, "    }\n");
   fprintf(stdout, "}\n");
}

int main() {
  int  sizes[] = {128, 256, 512};
  int  stypes[] = {T_FLOAT, T_DOUBLE};
  int  dtypes[] = {T_BYTE, T_SHORT, T_INT, T_LONG};
  for(int st = 0; st < sizeof(stypes)/sizeof(int); st++) {
      for(int dt = 0; dt < sizeof(dtypes)/sizeof(int); dt++) {
        for(int s = 0; s < sizeof(sizes)/sizeof(int); s++) {
           printBM(stypes[st], dtypes[dt], sizes[s]);
        }
      }
  }
  return 0;
}
