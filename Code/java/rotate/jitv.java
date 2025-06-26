
class jitv {
  public static final int LEN  = 128;

  public static void rleft(int [] arr, int [] res, int shift) {
    for(int i = 0 ; i < LEN ; i++) {
       res[i] = Integer.rotateRight(arr[i], arr[i]);
    }
  }

  // Driver
  public static void main(String [] args) {
    int [] arr = new int[LEN];
    int [] res = new int[LEN];
    jitv obj = new jitv();
    for( int i = 0; i < LEN ; i++)
      arr[i]  = i;

    int Res=0;
    //for (int k = 0 ; k < 9000000 ; k++)
    //  rleft(arr, res, k);

    //Res=0;
    long t1 = System.nanoTime();
    for (int k = 0 ; k < 100000 ; k++)
      rleft(arr, res, k);
    long t2 = System.nanoTime();
    
    System.out.println("[Time] " + (t2-t1));
    for (int i = 0; i < res.length; i++) 
      System.out.println(" res[" + i + "] = " + res[i]);
  }
}
