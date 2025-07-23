
class jit {
  public static int LEN = 10000;
  public static long [] arr;

  // MUT
  public static long micro(long [] arr, int index, long value) {
     for (int inner = 0 ; inner < LEN ; inner++) {
        arr[inner] = index;
     }
     return arr[index];
  }

  // Driver
  public static void main(String [] args) {
    jit obj = new jit();
    arr = new long[LEN];
    for( int i = 0; i < LEN ; i++)
      arr[i]  = 1;
 
    int Res = 0;
    for (int k = 0 ; k < 1000000 ; k++)
      Res += micro(arr, (k) & (LEN-1), 50);

    long t1 = System.nanoTime();
    Res = 0;
    for (int k = 0 ; k < 900000 ; k++)
      Res += micro(arr, (k) & (LEN-1), 50);
    long t2 = System.nanoTime();


    //System.gc();
    System.out.println("[Time] " + (t2-t1) +  " Res = " + Res);

  } 
} 
