
public class copysign {

  public static double micro(double [] dst , double [] src, int ctr) {
     //for(int i = 0 ; i < dst.length; i++) {
     dst[ctr] = Math.copySign(dst[ctr], src[ctr]);
     //}
     //return dst[(ctr&(dst.length -1))]; 
     return dst[ctr]; 
  }

  public static void main (String [] args) { 
    double Res = 0.0;
    double [] src = new double[1024];
    double [] dst = new double[1024];

    for ( int i = 0 ; i < dst.length; i++)  {
       src[i] = (double)(-i);
       dst[i] = (double)i;
    }

    for ( int i = 0 ; i < 10000000 ; i++)  {
      Res += micro(dst, src, i&(dst.length-1));
    }
    System.out.println("Res =  " + Res);
  }
}
