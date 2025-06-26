import java.util.zip.Adler32;
import java.util.Arrays;

class test {
  public static Adler32 cksum;

  public static long micro(byte [] src) {
      cksum.reset();
      cksum.update(src, 0, src.length);     
      return cksum.getValue();
  }

  public static void main(String [] args) {
     long res = 0;
     cksum = new Adler32();
     byte [] src = new byte[8*1024];

     for(int i = 0; i < 8*1024; i++) {
        src[i] = (byte)i;
     }
     for(int i = 0; i < 1000000; i++) {
         res += micro(src);
     } 
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 1000000; i++) {
         res += micro(src);
     } 
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + res);
  }
}

