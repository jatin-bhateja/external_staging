
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class selectFrom {

  public static final VectorSpecies<Byte> SP = ByteVector.SPECIES_256;

  public static void micro(byte [] dst, byte [] src1, byte [] src2) {
      ByteVector.fromArray(SP, dst, 0)
                   .selectFrom(ByteVector.fromArray(SP, src1, 0),
                               ByteVector.fromArray(SP, src2, 0))
                   .intoArray(dst, 0);
  }

  public static void main(String [] args) {
     byte [] dst = new byte[32];
     byte [] vals = new byte [32];
     byte [] src1 = new byte [32];
     byte [] src2 = new byte [32];

     IntStream.range(0, 32).forEach(i -> {src1[i] = (byte)(10 * i);});
     IntStream.range(0, 32).forEach(i -> {src2[i] = (byte)(100 * i);});
     IntStream.range(0, 32).forEach(i -> {vals[i] = (byte)(i * 20);});

     for (int i = 0; i < 10000; i++) {
        System.arraycopy(vals, 0, dst, 0, 8);
        micro(dst, src1, src2);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 10000; i++) {
        System.arraycopy(vals, 0, dst, 0, 8);
        micro(dst, src1, src2);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[src1] = " + Arrays.toString(src1));
     System.out.println("[src2] = " + Arrays.toString(src2));
     System.out.println("[vals] = " + Arrays.toString(vals));
     System.out.println("[time] " + (t2-t1) + "ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0 , 8)));
  }
}
