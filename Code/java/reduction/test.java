
import jdk.incubator.vector.*;

class test {
/*
  public static int doRed1( int [] vec) {
    int Res = 0;
    for (int i = 0 ; i < vec.length; i++)
     Res = Math.max(Res,vec[i]);
    return Res;
  }
*/
  
  public static int doRed2( int [] vec) {
    int Res = int.MIN_VALUE;
    intVector.intSpecies is = intVector.species(Vector.Shape.S_512_BIT);
    for (int i = 0 ; i < vec.length; i+= is.length()) {
      intVector iv = intVector.fromArray(is, vec, i);
      Res = Math.max(iv.maxAll(), Res);
    }
    return Res;
  }

  public static void main (String [] args) {
     int [] vec = new int[16];
     for (int i = 0 ; i < vec.length; i++)
       vec[i] = i + 1;
     int Res = 0;
/*
     for (int i = 0 ; i < 100000 ; i++)
       Res += doRed1(vec);
*/
     System.out.println("Res = " + Res);
     for (int i = 0 ; i < 1000000 ; i++)
       Res += doRed2(vec);
     System.out.println("Res = " + Res);
  }
}


/*
---------------------------------------
int   : N, i
float : a,b,c,tmp,res
---------------------------------------
 for(int i = 0; i < N ; i++)
    tmp[i] = a[i] * b[i];
 for(int j = 0 ; i < N ; i++)
    res[i] = tmp[i] + c[i];
---------------------------------------

 for(int j = 0 ; i < N ; i++)
    res[i] = a[i] * b[i] + c[i];

---------------------------------------
  VFMA
---------------------------------------
*/

