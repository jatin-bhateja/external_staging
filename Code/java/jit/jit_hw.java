
public class jit {
  public int micro(int [] a , int [] b) {
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    jit obj = new jit(); 
    for ( int i = 0 ; i < 10000000 ; i++)  {
      Res += obj.micro(i%72, i + 10);
      if(i % 100000 == 0) {
         System.gc();
      }
    }
    System.out.println("Res =  " + Res);
  }
}
