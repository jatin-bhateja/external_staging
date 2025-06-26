
class jit {
  public static final int LEN  = 1024;
  public static int rleft(int val, int shift) {
    return Integer.rotateLeft(val+1,shift) + Integer.rotateRight(val,shift);
    //return 10 + Integer.rotateLeft(val,shift);
    //return 10 + Integer.rotateRight(val,shift);
  }

  // Driver
  public static void main(String [] args) {
    int [] arr = new int[LEN];
    jit obj = new jit();
    for( int i = 0; i < LEN ; i++)
      arr[i]  = i*10;

    int Res=0;
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
