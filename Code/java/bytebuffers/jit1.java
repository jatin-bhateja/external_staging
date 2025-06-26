
import java.nio.ByteBuffer;
import sun.misc.Unsafe;
import java.lang.reflect.*;

class jit {
  private final static int BUFFER_SIZE = 1024;
  private final static int N = 16 * 1024;
  private final static int FILLER = 55;

  private static Unsafe getUnsafe() throws Exception {
     Field f = Unsafe.class.getDeclaredField("theUnsafe");
     f.setAccessible(true);
     return (Unsafe)f.get(null);
  }

  private static void set(byte[] b, int ofs, int len, int value) {
      for (int i = 0; i < len; i++) {
          b[ofs + i] = (byte)value;
      }
  }

  private static void check(byte[] b, int ofs, int len, int value) {
      for (int i = 0; i < len; i++) {
          int r = b[ofs + i] & 0xff;
          if (r != value) {
            System.out.println("i = " + i + " ofs = " + ofs + " len = " + len  + " exp value = " + value + " actual value = " + r);
            throw new RuntimeException("mismatch");
          }
      }
  }

  private static byte testSetByteArray(Unsafe unsafe, int index) throws Exception {
    byte[] b = new byte[BUFFER_SIZE];
    set(b, 0, BUFFER_SIZE, FILLER);
    int ofs = 393;
    int len = 142;
    int val = 85;
    unsafe.setMemory(b, Unsafe.ARRAY_BYTE_BASE_OFFSET + ofs, len, (byte)val);
    for(int i = 0 ; i < b.length ;i++) {
      System.out.println(" b["+i+"] = " + b[i]);
    }
    check(b, ofs, len, val);
    check(b, ofs + len, BUFFER_SIZE - (ofs + len), FILLER);
    return b[index];
  }

  public static void main (String [] args) { 
    long Res = 0 ;
    try {
      long t1 = System.currentTimeMillis();
      Unsafe unsafe = getUnsafe();
//      for ( int i = 0 ; i < 100000 ; i++)  {
        Res += testSetByteArray(unsafe, 121 & (BUFFER_SIZE-1));
//      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] : " + (t2-t1) + " ms " + "[Res] :" + Res);
    } catch (Exception e) {
      System.out.println(e);
    }
  }

}
