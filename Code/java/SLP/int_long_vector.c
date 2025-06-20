  void micro(long * lDst, long * lSrc, int * iDst, int * iSrc) {
    for(int i = 0; i < 512; i++) {
       iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
       lDst[i] = lSrc[i + 1]; // ZMM : 8
    }
  }

