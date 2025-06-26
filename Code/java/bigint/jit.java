import java.math.BigInteger;

public class jit {
  public static int micro(byte [] res, byte [] a , byte [] b, int ctr) {
     BigInteger ba = new BigInteger(a);
     BigInteger bb = new BigInteger(b);
     byte [] tmp = bb.add(ba).toByteArray();
     System.arraycopy(tmp, 0, res, 0, tmp.length);
     return res[ctr&(res.length-1)];
  }

  public static void main (String [] args) { 
    int res = 0;
    byte [] a = new byte[1024];
    byte [] b = new byte[1024];
    byte [] r = new byte[1024];

    for(int i = 0; i < a.length; i++) {
      a[i] = (byte)i;
      b[i] = (byte)i;
    }
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro(r, a, b , i&(r.length-1));
    }
    long t1 = System.currentTimeMillis();
    for ( int i = 0 ; i < 100000 ; i++)  {
      res += micro(r, a, b , i&(r.length-1));
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + " [Res] " + res);
  }
}
