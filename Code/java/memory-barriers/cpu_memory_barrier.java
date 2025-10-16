
import jdk.incubator.vector.*;
import java.nio.ByteOrder;
import java.lang.foreign.*;
import java.util.Arrays;

public class cpu_memory_barrier {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   public static void memops(MemorySegment dst, MemorySegment src, long offset) {
       IntVector vec = IntVector.fromMemorySegment(ISP, src, offset, ByteOrder.nativeOrder());
       vec.intoMemorySegment(dst, offset, ByteOrder.nativeOrder());
   }

   public static void main(String [] args) {
      int [] asrc = new int[102400];
      int [] adst = new int[102400];
      Arrays.fill(asrc, 1);
      try (Arena arena = Arena.ofConfined()) { 
          //MemorySegment src = arena.allocate(102400);
          //MemorySegment dst = arena.allocate(102400);
          MemorySegment src = MemorySegment.ofArray(asrc);
          MemorySegment dst = MemorySegment.ofArray(adst);
           
          src.fill((byte)10);
          for (int i = 0; i < ISP.loopBound(102400 / ISP.vectorByteSize()); i++) {
             memops(dst, src, i * ISP.vectorByteSize()); 
          }
          IO.println("[dst off:0] " + dst.get(ValueLayout.JAVA_INT, 0));
          IO.println("[dst off:1020] " + dst.get(ValueLayout.JAVA_INT, 1020));
      }
   }
}
