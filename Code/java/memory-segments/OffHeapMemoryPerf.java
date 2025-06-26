
import java.lang.foreign.*;
import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveTask;

public class OffHeapMemoryPerf {
   public static boolean DEBUG = false;
   public static int SPLIT_THRESHOLD = 1000;
   public static Arena arena = null;
   public static MemorySegment unified_ms = null;
   public static MemorySegment [] segmented_ms = null;
   public static Random r = new Random(1024);
   public static int workers = 0;
   public static int index_size = 0;
   public static enum MSKind {
       IS_AUTO, IS_CONFINED, IS_SHARED, IS_GLOBAL;
   }
   public static MSKind mskind;

   public static void setupBenchmark() {
       // Change this with different kinds of arenas.
       arena = switch(mskind.ordinal()) {
                 case 0 -> Arena.ofAuto();
                 case 1 -> Arena.ofConfined();
                 case 2 -> Arena.ofShared();
                 default -> Arena.global();
       };

       unified_ms = arena.allocate(index_size * 4, 64);
       for (int i = 0; i < index_size; i++) {
           unified_ms.setAtIndex(ValueLayout.JAVA_INT, i, r.nextInt(30));
       }

       segmented_ms = new MemorySegment[workers];

       int i = 0; 
       long offset = 0;
       long segment_size = index_size / workers;
       for (; i < workers - 1; i++, offset += segment_size) {
           segmented_ms[i] = unified_ms.asSlice(offset, segment_size);
       }
       segmented_ms[i] = unified_ms.asSlice(offset);
     
   }

   public static void cleanupBenchmark() {
      if (mskind == MSKind.IS_CONFINED || mskind == MSKind.IS_SHARED) {
          arena.close();
      }
   }

   static class SearchTask extends RecursiveTask<Integer> {
       public int sindex;
       public int eindex;
       public int query;
       public MemorySegment ms;
       public List<Integer> res;

       public SearchTask(MemorySegment ms, List<Integer> res, int sindex, int eindex, int query) {
          this.ms = ms;
          this.query = query;
          this.sindex = sindex;
          this.eindex = eindex;
          this.res = res;
       }

       public Integer compute() {
          if ((eindex - sindex) < SPLIT_THRESHOLD) {
              int min = Integer.MAX_VALUE;            
              int max = Integer.MIN_VALUE;            
              for (int i = sindex ; i < eindex; i++) {
                  int val = ms.getAtIndex(ValueLayout.JAVA_INT, i);
                  min = Integer.min(min, val);
                  max = Integer.max(max, val);
                  if (val == query) {
                     res.add(i);
                  }
              }
              if (DEBUG) {
                  System.out.println("[thread]" + Thread.currentThread()     +
                                     "{sindex:eindex} = [" + sindex + " : "  +
                                     eindex + "] " +  " {min:max} = [" + min +
                                     " : " + max + "]");
              }
              return res.size();
          }
          int moffset = (sindex + eindex) / 2;
          var ltask = new SearchTask(ms, res, sindex, moffset - 1, query);
          ltask.fork();
          var rtask = new SearchTask(ms, res, moffset, eindex, query);
          return rtask.compute() + ltask.join();
       }
   }

   public static void main(String [] args) {
       workers = Integer.parseInt(args[0]);
       SPLIT_THRESHOLD = Integer.parseInt(args[1]);
       index_size = Integer.parseInt(args[2]);
       int query = Integer.parseInt(args[3]);
       mskind = switch(Integer.parseInt(args[4])) {
           case 0 -> MSKind.IS_AUTO;
           case 1 -> MSKind.IS_CONFINED;
           case 2 -> MSKind.IS_SHARED;
           default -> MSKind.IS_GLOBAL;
       };
       DEBUG = Boolean.parseBoolean(args[5]);
       List<Integer> res = new ArrayList<Integer>();
       System.out.println("Creating a ForkJoinPool of " + workers + " worker threads.");
       System.out.println("MemorySegment Kind : " + mskind);

       setupBenchmark();

       long t1 = 0;
       try (ForkJoinPool pool = new ForkJoinPool(workers)) {
         t1 = System.currentTimeMillis();
            for (int i = 0; i < 100000; i++) {
            SearchTask task = new SearchTask(unified_ms, res, 0, (int)(unified_ms.byteSize() >>> 2), query); 
            pool.submit(task);
         }
       }
       long t2 = System.currentTimeMillis();
       cleanupBenchmark();
       System.out.println("[time] " + (t2 - t1) + " ms [match count] " + res.size());
   }
}
