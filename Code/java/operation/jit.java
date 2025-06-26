class jit {
  public int microWL (int a , int b) {
     return a % b;
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    for ( int i = 0 ; i < 1000000 ; i++)  {
      jit obj = new jit(); 
      Res += obj.microWL(i, i+100);
    }
    System.out.println("Res =  " + Res);
  }

}
