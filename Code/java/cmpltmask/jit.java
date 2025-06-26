class jitcore {
  public static int addNums (int a , int b) {
     return a + b;
  }
}

class jit {
  public int caller(int a) {
     return jitcore.addNums(a, 10 );
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    while(Res != -1) {
    for ( int i = 0 ; i < 1000000 ; i++)  {
      jit obj = new jit(); 
      Res += obj.caller(i);
      if (i % 10000 == 0)
         System.gc();
    }
    }
    System.out.println("Res =  " + Res);
  }

}
