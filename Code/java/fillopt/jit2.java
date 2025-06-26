
class jit {
  public static final int LEN  = 100000;
  public static int [] arr;

  // MUT
  public static float micro(int [] arr, int index, int len, int value, int stride) {
     for (int i = 0 ; i < len ; i++)
        arr[i] = value;
     return arr[index] + 100;
  }


  // Driver
  public static void main(String [] args) {
    jit obj = new jit();
    arr = new int[LEN];
    for( int i = 0; i < LEN ; i++)
      arr[i]  = 1;

 
    int Res = 0;
    for (int k = 0 ; k < 1000000 ; k++)
      Res += micro(arr, (k)  % (arr.length/2), 256, 50,  (k&0x1)+1);

    long t1 = System.nanoTime();
    Res = 0;
    for (int k = 0 ; k < 100000 ; k++)
      Res += micro(arr, (k)  % (arr.length/2), 256, 50,  (k&0x1)+1);
    long t2 = System.nanoTime();


    //System.gc();
    System.out.println("[Time] " + (t2-t1) +  " Res = " + Res);

  } 
} 
