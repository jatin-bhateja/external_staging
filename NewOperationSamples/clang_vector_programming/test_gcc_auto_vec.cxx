__attribute__((optimize("no-tree-vectorize")))
void unsafe_scalar_add(int* res, int* src1, int* src2, int len) {
   for (int i = 0; i < len; i++) {
      res[i] = src1[i] + src2[i];
   }
}

