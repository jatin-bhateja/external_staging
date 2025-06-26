
class jit {
  public static final int LEN  = 1023;

  // MUT
  public static int micro(int [] r, int [] a, int [] b, int index) {
    for(int i = 0 ; i < r.length ; i++)
      r[i] = a[i] + b[i];
    return r[index]; 
  }

  // Driver
  public static void main(String [] args) {
    jit obj = new jit();
    int [] a = new int[LEN];
    int [] b = new int[LEN];
    int [] r = new int[LEN];

    for( int i = 0; i < LEN ; i++) {
      a[i]  = 1;
      b[i]  = 1;
    }
    int Res = 0;
    for (int k = 0 ; k < 9000000 ; k++)
      Res += micro(r, a, b, k % r.length);

    Res = 0;
    for (int k = 0 ; k < 100000 ; k++)
      Res += micro(r, a, b, k % r.length);

    //System.gc();
    System.out.println("Res = " + Res);
  } 
} 
