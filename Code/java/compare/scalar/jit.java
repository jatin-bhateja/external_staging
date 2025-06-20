
class jit {
  public static int caller(int a, int b) {
   return Integer.compare(a,b);
  }

  public static void main (String [] args) { 
   int Res = 0 ;
   for ( int i = 0 ; i < 1000000 ; i++)  {
     Res += caller(i % 1000, (i+400) % 1000);
   }
   System.out.println("Res =  " + Res);
  }
}
