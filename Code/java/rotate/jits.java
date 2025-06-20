
class jits {
  public static final int LEN  = 1024;
  public static int rleft(short[] val, int shift) {
    int res = 0;
    for (int k = 0 ; k < val.length ; k++) {
       res += (short)(val[k] >>> shift | val[k]  << -shift);
    }
   return res;
  }

  // Driver
  public static void main(String [] args) {
    short [] arr = new short[LEN];
    jits obj = new jits();
    for( int i = 0; i < LEN ; i++)
      arr[i]  = (short)0x1;

    int Res=0;
    for (int k = 0 ; k < 10000 ; k++)
      Res += rleft(arr, 7);

    Res=0;
    long t1 = System.nanoTime();
    for (int k = 0 ; k < 10000 ; k++)
      Res += rleft(arr, 7);
    long t2 = System.nanoTime();
    
    System.out.println("[Time] " + (t2-t1) + " Res = " + Res);
  }
} 
