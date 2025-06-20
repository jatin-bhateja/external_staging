
import jdk.incubator.vector.*;

class loadm {
  public static boolean flag = true;
  public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256;
  public static Vector<Byte> BVEC;

  public static byte workload(byte [] d, byte [] s, int ctr) {
    //for(int i = 16; i < SPECIES.loopBound(s.length); i+=SPECIES.length()) {
      //VectorMask<Byte> mask = BVEC.compare(VectorOperators.LT, 15);
      VectorMask<Byte> mask = VectorMask.fromLong(ByteVector.SPECIES_256, 15);
      ByteVector vec = ByteVector.fromArray(SPECIES, s, 992, mask);
      vec.intoArray(d, 0);
    //}
    return d[ctr];
  }

/*
  public static byte workload(byte [] d, byte [] s, int ctr) {
    for(int i = 5; i < s.length; i+=SPECIES.length()) {
      VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, (1 << (i & (SPECIES.length()-1))) - 1) ;
      ByteVector vec = ByteVector.fromArray(SPECIES, s, i, mask);
      vec.intoArray(d, i);
    }
    return d[ctr];
  }

  public static byte workload(byte [] d, byte [] s, int ctr) {
    for(int i = 0; i < SPECIES.loopBound(s.length); i+=SPECIES.length()) {
      VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, (1 << 15)-1);
      ByteVector vec = ByteVector.fromArray(SPECIES, s, i, mask);
      vec.intoArray(d, i);
    }
    return d[ctr];
  }

  public static byte workload(byte [] d, byte [] s, int ctr) {
    for(int i = 0; i < SPECIES.loopBound(s.length); i+=SPECIES.length()) {
      VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, (1 << 15)-1);
      ByteVector vec = ByteVector.fromArray(SPECIES, s, i, mask);
      vec.intoArray(d, i);
    }
    return d[ctr];
  }
*/

  public static void main(String [] args) {
     byte res = 0;
     byte [] r = new byte[1024];
     byte [] s = new byte[1024];
     BVEC = ByteVector.SPECIES_256.broadcast(10);
     for(int i = 0 ; i < s.length ; i++) {
         s[i] = (byte)i;
     }
     for(int i = 0 ; i < 900000 ;i++) {
          res += workload(r, s, i & 7);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 900000 ;i++) {
          res += workload(r, s, i & 7);
     }
     long t2 = System.currentTimeMillis();
     for(int i = 0; i  < SPECIES.length() ; i++)
       System.out.println("r[" + i + "] = " + r[i]);
     System.out.println("[Res] " + res + " [Time] " + (t2-t1) + " ms ");
  }
}
