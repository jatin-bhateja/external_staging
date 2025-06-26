int micro(int * res2, int * res1, int * src1, int * src2, int length) {
//int micro(int * res2, int * src1, int * src2, int length) {
  // Same iteration space, loop combining + removal of redundant res1 loads.

  // Stores are not re-ordered with respect to previous stores.

  // LoadVector ===> Vector Graph ===> StoreVector
  for(int i = 0; i < 1024; i++) {
     res1[i] = src1[i] + src2[i];
     // Store order in fully unrolled loop: res1[0], res1[1].....res1[1023]
  }

  for(int i = 0; i < 1024; i++) {
     res2[i] = src1[i] * src2[i];
     // Store order in fully unrolled loop: res2[0], res2[1].....res2[1023]
  }

  // Vectorization should not break the memory ordering effect.

  // Combining two loop bodies and generating vectorized stores will 
  // interleave the vectorized stores across the iterations, thus violating
  // memory ordering, which expects all res1 stores should retire
  // prior to res2 stores.

  // From user's prespective, ordering is only relevant in context of share
  // accesses, but incoming pointer arguments may point to a global shared memory.

  // LoadFNode (Alias [F)
  return res2[3];
}

