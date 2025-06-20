
import jdk.incubator.vector.*;

class storem {
  public static boolean flag = true;

  public static byte workload(byte [] d, byte [] s, int ctr) {
    VectorMask<Byte> mask = VectorMask.fromLong(ByteVector.SPECIES_256, 15);
    ByteVector vec = ByteVector.fromArray(ByteVector.SPECIES_256, s, 0, mask);
    vec.intoArray(d, 0, mask);
    return d[ctr];
  }

  public static void main(String [] args) {
    float res = 0;
    byte [] r = new byte[8];
    byte [] s = new byte[8];
    for(int i = 0 ; i < 2 ; i++) {
        s[i] = (byte)i;
    }
    for(int i = 0 ; i < 900000 ; i++) {
        res += workload(r, s, i & 1);
    }
    long t1 = System.currentTimeMillis();
    for(int i = 0 ; i < 900000 ;i++) {
        res += workload(r, s, i & 1);
    }
    long t2 = System.currentTimeMillis();
    for(int i = 0; i  < 2 ; i++)
      System.out.println("r[" + i + "] = " + r[i]);
    System.out.println("[Res] " + res + " [Time] " + (t2-t1) + " ms ");
  }
}
