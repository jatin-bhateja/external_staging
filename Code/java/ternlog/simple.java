
class jit {
  public static int micro (int a , int b) {
     return a & (~b);
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    for ( int i = 0 ; i < 1000000 ; i++)  {
      jit obj = new jit(); 
      Res += obj.micro(i, i+1);
      //if (i % 10000 == 0)
      //   System.gc();
    }
    System.out.println("Res =  " + Res);
  }

}
