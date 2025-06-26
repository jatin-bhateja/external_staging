class jit {
  public static boolean call_stub(int [] a , int [] b) {
    return a[0] == b[0];
  } 
  public static boolean compare(int length, int []  a , int  [] b) {
     boolean res;
     if (length < 32 )  {
       res = true;
     } else {
       res = call_stub(a,b);
     }
     return res;
  }
  public static void main (String [] args) { 
    int Res = 0 ;
    int [] a = new int[1024];
    int [] b = new int[1024];
    a[0] = 1313;
    b[0] = 1314;
    for ( int i = 0 ; i < 1000000 ; i++)  {
      Res += compare(i & 511, a, b) ? 1 : 0;
    }
    System.out.println("Res =  " + Res);
  }

}
