
import java.lang.foreign.*;
import java.util.stream.IntStream;

public class MemSegmentsLifetime {

   public static int micro1(int size) {
       /*
          An automatic arena, which is created with Arena::ofAuto.
          This is an area that's managed, automatically, by the garbage collector.
          Any thread can access memory segments allocated by an automatic arena.
          If you call Arena::close on an automatic arena, you'll get 
          an UnsupportedOperationException.
       */
       int res = 0;
       // try with resource block
       try (Arena scope = Arena.ofAuto()) {
           MemorySegment ms = scope.allocate(size, 64);
           IntStream.range(0, size >>> 2).forEach(i -> ms.setAtIndex(ValueLayout.JAVA_INT, i, 10*i));
           res = IntStream.range(0, size >>> 2).map(i -> ms.getAtIndex(ValueLayout.JAVA_INT, i)).sum();
       }
       return res;
        /*
            CPROMPT>java -cp . MemSegmentsLifetime 10000000
            Exception in thread "main" java.lang.UnsupportedOperationException: Attempted to close a non-closeable session
                     at java.base/jdk.internal.foreign.MemorySessionImpl.nonCloseable(MemorySessionImpl.java:313)
                     at java.base/jdk.internal.foreign.ImplicitSession.justClose(ImplicitSession.java:65)
                     at java.base/jdk.internal.foreign.MemorySessionImpl.close(MemorySessionImpl.java:227)
                     at java.base/jdk.internal.foreign.ArenaImpl.close(ArenaImpl.java:50)
                     at MemSegmentsLifetime.micro1(MemSegmentsLifetime.java:20)
                     at MemSegmentsLifetime.main(MemSegmentsLifetime.java:28)
            CPROMPT>
        */
   }

   public static int micro2(int size) {
       /*
          An automatic arena, which is created with Arena::ofAuto.
          This is an area that's managed, automatically, by the garbage collector.
          Any thread can access memory segments allocated by an automatic arena.
          If you call Arena::close on an automatic arena, you'll get 
          an UnsupportedOperationException.
       */
       Arena scope = Arena.ofAuto();
       MemorySegment ms = scope.allocate(size, 64);
       IntStream.range(0, size >>> 2).forEach(i -> ms.setAtIndex(ValueLayout.JAVA_INT, i, 10*i));
       return IntStream.range(0, size >>> 2).map(i -> ms.getAtIndex(ValueLayout.JAVA_INT, i)).sum();
   }

   public static int micro3(int size) {
       /*
          A confined arena, which is created with Arena::ofConfined. A confined arena
          provides a bounded and deterministic lifetime.
       */
       int res = 0;
       try (Arena scope = Arena.ofConfined()) {
           MemorySegment ms = scope.allocate(size, 64);
           IntStream.range(0, size >>> 2).forEach(i -> ms.setAtIndex(ValueLayout.JAVA_INT, i, 10*i));
           res = IntStream.range(0, size >>> 2).map(i -> ms.getAtIndex(ValueLayout.JAVA_INT, i)).sum();
       }
       return res;
   }

   public static int micro4(int size) {
       /*
          A shared arena, which is created with Arena::ofShared. Shared arena is closable memory segment
          which can be accessed and closed by any thread.
       */
       int res = 0;
       try (Arena scope = Arena.ofShared()) {
           MemorySegment ms = scope.allocate(size, 64);
           IntStream.range(0, size >>> 2).forEach(i -> ms.setAtIndex(ValueLayout.JAVA_INT, i, 10*i));
           res = IntStream.range(0, size >>> 2).map(i -> ms.getAtIndex(ValueLayout.JAVA_INT, i)).sum();
       }
       return res;
   }

   public static int micro5(int size) {
       /*
          An global arena, which is created with Arena::global() never de-allocates the memory
          associated with memory segments.
       */
       int res = 0;
       Arena scope = Arena.global();
       MemorySegment ms = scope.allocate(size, 64);
       IntStream.range(0, size >>> 2).forEach(i -> ms.setAtIndex(ValueLayout.JAVA_INT, i, 10*i));
       res = IntStream.range(0, size >>> 2).map(i -> ms.getAtIndex(ValueLayout.JAVA_INT, i)).sum();
       return res;
   }

   public static void main(String [] args) {
       int res = 0;
       int algo = Integer.parseInt(args[0]);
       int size = Integer.parseInt(args[1]);
       if (algo == 0 || algo == -1) {
           try {
               for (int i = 0; i < 100000; i++) {
                   res += micro1(size);
               }
               long t1 = System.currentTimeMillis();
               for (int i = 0; i < 100000; i++) {
                   res += micro1(size);
               }
               long t2 = System.currentTimeMillis();
               System.out.println("[time ofAuto-with-closable] " + (t2-t1) + " ms  [res] " + res);
          } catch (Exception e) {
               System.out.println(e);
          }
       }
       res = 0;
       if (algo == 1 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro2(size);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro2(size);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time of ofAuto-wo-closable] " + (t2-t1) + " ms  [res] " + res);
       } 
       res = 0;
       if (algo == 2 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro3(size);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro3(size);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time ofConfined] " + (t2-t1) + " ms  [res] " + res);
       }
       res = 0;
       if (algo == 3 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro4(size);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro4(size);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time ofShared] " + (t2-t1) + " ms  [res] " + res);
       }
       res = 0;
       if (algo == 4 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro5(size);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro5(size);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time global] " + (t2-t1) + " ms  [res] " + res);
       }
   }
}
