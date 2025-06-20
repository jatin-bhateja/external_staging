
class jitl {
  public static final int LEN  = 1024;
  public static long rleft(long val, int shift) {
    return Long.rotateLeft(val+1,shift) + Long.rotateRight(val,shift);
    //return 10 + longeger.rotateLeft(val,shift);
    //return 10 + Integer.rotateRight(val,shift);
  }

  // Driver
  public static void main(String [] args) {
    long [] arr = new long[LEN];
    jit obj = new jit();
    for( int i = 0; i < LEN ; i++)
      arr[i]  = i*10;

    long Res=0;
    for (int k = 0 ; k < 9000000 ; k++)
      Res += rleft(arr[k& (LEN-1)], (k) & 0xFFFFFFFF);

    Res=0;
    long t1 = System.nanoTime();
    for (int k = 0 ; k < 100000 ; k++)
      Res += rleft(arr[k& (LEN-1)], (k) & 0xFFFFFFFF);
    long t2 = System.nanoTime();
    
    System.out.println("[Time] " + (t2-t1) + " Res = " + Res);
  }
} 
