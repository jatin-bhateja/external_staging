
import java.nio.ByteOrder;
import java.lang.foreign.*;
import jdk.incubator.vector.*;

public class memseg {
   public static final VectorSpecies<Long> SPECIES = LongVector.SPECIES_512;

   public static void micro(MemorySegment out, MemorySegment in) {
       for (long i = 0; i < in.byteSize(); i += SPECIES.length () << 3) {
           LongVector.fromMemorySegment(SPECIES, in, i, ByteOrder.nativeOrder())
                      .intoMemorySegment(out, i, ByteOrder.nativeOrder());
       }
   }

   public static MemorySegment init(MemorySegment ms, long val) {
       for (long i = 0; i < ms.byteSize(); i+= Long.BYTES) {
           ms.set(ValueLayout.JAVA_LONG, i, val); 
       }
       return ms;
   }

   public static Long accumulate(MemorySegment ms) {
       long res = 0;
       for (long i = 0; i < ms.byteSize(); i += Long.BYTES) {
           res += ms.get(ValueLayout.JAVA_LONG, i);
       }
       return res;
   }

   public static void main(String [] args) {
      MemorySegment in = init(Arena.ofAuto().allocate(1024, Long.SIZE), 30L);
      MemorySegment out = Arena.ofAuto().allocate(1024, Long.SIZE);
      for (int i = 0; i < 10000; i++) {
          micro(out, in);
      }
      System.out.println("[res]  " + accumulate(out));
   }
}
