
class jitvl {
  public static final int LEN  = 32;

  public static long rleft(long [] arr1, int [] arr2, int shift) {
    long res = 0;
    for(int i = 0 ; i < LEN ; i++) {
       res +=  Long.rotateLeft(arr1[i], arr2[i]);
    }
    return res;
  }

  // Driver
  public static void main(String [] args) {
    long [] arr1 = new long[LEN];
    int  [] arr2 = new int[LEN];
    jitvl obj = new jitvl();
    for( int i = 0; i < LEN ; i++) {
      arr1[i]  = 1;
      arr2[i]  = 1;
    }

    long Res=0;
    for (int k = 0 ; k < 9000000 ; k++)
      Res += rleft(arr1, arr2, k);

    Res=0;
    long t1 = System.nanoTime();
    for (int k = 0 ; k < 100000 ; k++) {
      Res += rleft(arr1, arr2, k);
    }
    long t2 = System.nanoTime();
    
    System.out.println("[Time] " + (t2-t1) + " Res = " + Res);
  }
}
