
import java.lang.foreign.*;
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class MemSegmentPerf {
   public static VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;
   
   // Arena.ofAuto(), scope specific: Managed, Non-Closeable :  On-Heap memory segment : allocated segment is live
   // till its referred by Arena
   public static float micro1(float [] arr) {
       float res = 0.0f;
       MemorySegment ms = MemorySegment.ofArray(arr);
       for (int i = 0; i < FSP.loopBound(arr.length); i += FSP.length()) {
           res += FloatVector.fromMemorySegment(FSP, ms, i * Float.BYTES, java.nio.ByteOrder.nativeOrder())
                             .reduceLanes(VectorOperators.ADD);
       } 
       return res;
   }


   // Arena.ofAuto(), scope specific: un-managed, Non-Closeable :  Off-Heap memory segment : allocated segment is live
   // till its cleaned up by appropriate cleaner.
   // Can result into memory leaks if Arena is sweeped out.
   public static float micro2(int size, float init) {
       float res = 0.0f;
       MemorySegment ms = Arena.ofAuto().allocate(size, 64);
       for (int i = 0; i < FSP.loopBound(size >>> 2); i += FSP.length()) {
           FloatVector.broadcast(FSP, init).intoMemorySegment(ms, i * Float.BYTES, java.nio.ByteOrder.nativeOrder());
       } 
       for (int i = 0; i < FSP.loopBound(size >>> 2); i += FSP.length()) {
           res += FloatVector.fromMemorySegment(FSP, ms, i * Float.BYTES, java.nio.ByteOrder.nativeOrder())
                             .reduceLanes(VectorOperators.ADD);
       } 
       return res;

   }

   // Arena.ofAuto(), scope specific: managed, Non-Closeable :  On-Heap memory segment : allocated segment is live
   // till its referred by Arena
   public static float micro3(int size, float init) {
       float res = 0.0f;
       float [] arr = new float[size];
       Arrays.fill(arr, init);
       MemorySegment ms = MemorySegment.ofArray(arr);
       for (int i = 0; i < FSP.loopBound(arr.length); i += FSP.length()) {
           res += FloatVector.fromMemorySegment(FSP, ms, i * Float.BYTES, java.nio.ByteOrder.nativeOrder())
                             .reduceLanes(VectorOperators.ADD);
       } 
       return res;

   }

   // Shared Arena.
   // Confined Arena.
   // Global Arena
   
   public static void main(String [] args) {
       float res = 0.0f;
       int algo = Integer.parseInt(args[0]);
       int size = Integer.parseInt(args[1]);
       float [] arr = new float[size];
       IntStream.range(0, size).forEach(i -> {arr[i] = (float)i;});
         
       if (algo == 0 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro1(arr);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro1(arr);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
       } else if (algo == 1 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro2(size, 1.0f);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro2(size, 1.0f);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
       } else if (algo == 2 || algo == -1) {
           for (int i = 0; i < 100000; i++) {
               res += micro3(size, 1.0f);
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 100000; i++) {
               res += micro3(size, 1.0f);
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
       }
   }
}
