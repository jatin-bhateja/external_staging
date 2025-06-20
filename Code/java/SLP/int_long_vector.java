class test {
  public static int [] iSrc;
  public static int [] iDst;

  public static long [] lSrc;
  public static long [] lDst;

  public static void micro() {
    for(int i = 0; i < 512; i++) {
       iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
       lDst[i] = lSrc[i + 1]; // ZMM : 8
    }
  }

  public static void main(String [] args) {
    iSrc = new int[1024];
    iDst = new int[1024];
    lSrc = new long[1024];
    lDst = new long[1024];

    for(int i = 0; i < 10000; i++) {
       micro();
    }
  }
}
