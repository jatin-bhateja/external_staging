
import java.lang.foreign.*;

public class test {
   public static void micro(MemorySegment mem) {
       mem.fill((byte)10);
   }   
   public static void main(String [] args) {
       MemorySegment mem = Arena.global().allocate(1024, 16);
       for (int i = 0; i < 10000; i++) {
          micro(mem);
       }
       System.out.println(mem);
   }
}
