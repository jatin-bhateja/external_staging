class jit {
  public static int leaf(int a , int b) {
     try {
       if ( a == b )
         throw new RuntimeException("Equal arguments");
       return a + b;
     } catch (Exception e) {
        System.out.println("Caught exception");
        System.out.println(e);
     }
     finally {
        if ( a == b )
          System.out.println("Finally called");
        return 10;
     }
  }

  public static int micro (int a , int b) {
     int res = 0;
     try {
       res = leaf(a, b);
     } catch(Exception e) {
        System.out.println("Caught exception");
        System.out.println(e);
     }
     return res + 10000;
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    for ( int i = 0 ; i < 1000000 ; i++)  {
      jit obj = new jit(); 
      Res += obj.micro(100000 , i % 200000 );
    }
    System.out.println("Res =  " + Res);
  }

}
