
import jdk.incubator.vector.*;
import java.lang.foreign.*;
import java.nio.*;
import java.util.Arrays;

public class test {
  public static VectorSpecies<Byte> BSPECIES = ByteVector.SPECIES_256;
  public static VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_256;
  public static VectorSpecies<Double> DSPECIES = DoubleVector.SPECIES_256;

  public static void microD2B(byte [] arr, MemorySegment dms) {
     VectorMask<Byte> mask = VectorMask.fromLong(BSPECIES, (1 << 16) - 1);
     for (int i = 0; i < dms.byteSize(); i += DSPECIES.length() * Double.BYTES) {
         ByteVector.fromMemorySegment(BSPECIES, dms, i, ByteOrder.nativeOrder(), mask)
                   .intoArray(arr, i);
     }
  }

  public static void microD2I(int [] arr, MemorySegment dms) {
     VectorMask<Integer> mask = VectorMask.fromLong(ISPECIES, 15);
     for (int i = 0, j = 0; i < dms.byteSize(); i += DSPECIES.length() * Double.BYTES, j += ISPECIES.length()) {
         IntVector.fromMemorySegment(ISPECIES, dms, i, ByteOrder.nativeOrder(), mask)
                   .intoArray(arr, j, mask);
     }
  }

  public static void microI2D(double [] arr, MemorySegment ims) {
     VectorMask<Double> mask = VectorMask.fromLong(DSPECIES, 3);
     for (int i = 0, j = 0; i < ims.byteSize(); i += ISPECIES.length() * Integer.BYTES, j += DSPECIES.length()) {
         DoubleVector.fromMemorySegment(DSPECIES, ims, i, ByteOrder.nativeOrder(), mask)
                     .intoArray(arr, j, mask);
     }
  }

  public static void main(String [] args) {
     int size = Integer.parseInt(args[0]);
     assert size > 0 && (0 == (size & (size - 1)));

     byte [] barr = new byte[size];
     int  [] iarr = new int[size >> 2];
     double [] darr = new double[size >> 3];
     Arrays.fill(darr, 1.0);
     Arrays.fill(iarr, 1);
     MemorySegment dms = MemorySegment.ofArray(darr);
     MemorySegment ims = MemorySegment.ofArray(iarr);

     for (int i = 0; i < 100000; i++) {
         microD2I(iarr, dms);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 100000; i++) {
         microD2I(iarr, dms);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms");
  }
}
