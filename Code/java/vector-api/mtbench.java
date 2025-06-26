
import jdk.incubator.vector.*;

public class mtbench implements Runnable {
   // Shared across all threads.
   public static int PROCS = Runtime.getRuntime().availableProcessors();
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   public static int SIZE = 1024*1024*1024;
   public static int [] array = new int [SIZE];

   // Thread specific.
   public int tid;
   public long res;

   public int start;
   public int end;

   public mtbench(int tid, int start, int end) {
      this.tid = tid;
      this.res = 0;
      this.start = start;
      this.end = end;
   }

   public static void initMem() {
      for (int i = 0; i < SIZE; i++) {
          array[i] = i;
      }
   }

   public void run() {
       System.out.println("Running thread " + tid + " processing array (" + start + " : " + end + ")");
       int i = start;
       for (; i < SPECIES.loopBound(end) - SPECIES.length(); i += SPECIES.length()) {
           res += IntVector.fromArray(SPECIES, array, i)
                           .reduceLanes(VectorOperators.ADD);
       }
       for (; i < end; i++) {
           res += array[i];
       }
   }

   public static void main(String [] args) throws Exception {
       int res = 0;
       PROCS = Integer.parseInt(args[0]);
       mtbench [] payloads = new mtbench[PROCS];
       Thread [] workers = new Thread[PROCS]; 
       int WORK_SLICE = SIZE / PROCS;
       for (int i = 0; i < PROCS; i++) {
           payloads[i] = new mtbench(i, i*WORK_SLICE, (i+1)*WORK_SLICE);
           workers[i] = new Thread(payloads[i]);
       }
       payloads[PROCS-1].end = SIZE;

       initMem();

       // Parallel jobs.
       System.out.println("Starting run with " + PROCS + " threads..");
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < PROCS; i++) {
           workers[i].start();
       }
       for (int i = 0; i < PROCS; i++) {
           workers[i].join();
       }
       long t2 = System.currentTimeMillis();
        
       // Process results.
       for (int i = 0;  i < PROCS; i++) {
           res += payloads[i].res;
       } 
       System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
   }
}
