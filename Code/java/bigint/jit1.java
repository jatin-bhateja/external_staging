import java.math.BigInteger;
import jdk.incubator.vector.*;

public class jit1 {
  public static int [] tmpr;
  public static int micro1(int [] a) {
     //BigInteger ba = new BigInteger(a);
     int res = 0;
     for(int i = 0 ; i < a.length; i++) {
        res += Integer.bitCount(a[i]);
     }
     return res;
  }

  public static int micro2(int [] a) {
     //BigInteger ba = new BigInteger(a);
     int res = 0;
     for(int i = 0 ; i < a.length; i++) {
        tmpr[i] = Integer.bitCount(a[i]);
     }
     for(int i = 0; i < tmpr.length; i++) {
        res += tmpr[i];
     }
     return res;
  }

  /*public static int micro3(int [] a) {
     //BigInteger ba = new BigInteger(a);
     int res = 0;
     for(int i = 0 ; i < SPECIES.loopBound(a.length); i+=SPECIES.length()) {
        IntVector.fromArray(SPECIES, a, i)
        .
        res += Integer.bitCount(a[i]);
     }
     for(int i = 0; i < tmpr.length; i++) {
        res += tmpr[i];
     }
     return res;
  }*/

  public static void main (String [] args) { 
    int res = 0;
    int [] a = new int[1024];
    tmpr = new int[a.length];

    for(int i = 0; i < a.length; i++) {
      a[i] = i;
    }
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro1(a);
    }
    long t1 = System.currentTimeMillis();
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro1(a);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] micro1  " + (t2-t1) + "ms [Res] " + res);

    res = 0;
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro2(a);
    }
    t1 = System.currentTimeMillis();
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro2(a);
    }
    t2 = System.currentTimeMillis();
    System.out.println("[Time] micro2  " + (t2-t1) + "ms [Res] " + res);
  }
}
