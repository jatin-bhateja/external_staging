class jit {
  private static long shiftLongs(long[] a, int count, long[] b, int bi, int shift, long mask) {
    int i = 0;
    for (; i < 1008; i++) {
      b[i+bi] = (a[i] >>> shift) & mask;
    }
    return b[i+bi -1];
  }

 public static void main (String [] args) {
    long Res = 0 ;
    long [] a = new long[1024];
    long [] b = new long[4086];
    for(int i = 0 ; i < 1024; i++) {
      a[i] = b[i] = i;
    }
	
    // Warmup
    for ( int i = 0 ; i < 1000000 ; i++)  {
      Res += shiftLongs(a, 1024, b, 16, i, -1L);
    }
    long t1 = System.currentTimeMillis();
    for ( int i = 0 ; i < 100000 ; i++)  {
      Res += shiftLongs(a, 1024, b, 16, i, -1L);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time ] " + (t2-t1) + "ms [Res ] " + Res);
  }
}

