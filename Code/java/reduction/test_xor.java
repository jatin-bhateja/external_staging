
import jdk.incubator.vector.*;

class test_xor {
  public static int doRed1( int [] vec) {
    int Res = 0;
    for (int i = 0 ; i < vec.length; i++)
      Res += vec[i] + vec[i];
    return Res;
  }
  
  public static void main (String [] args) {
     int [] vec = new int[16];
     for (int i = 0 ; i < vec.length; i++)
       vec[i] = i + 1;
     int Res = 0;
     for (int i = 0 ; i < 1000000 ; i++)
       Res += doRed1(vec);
     System.out.println("Res = " + Res);
  }
}
