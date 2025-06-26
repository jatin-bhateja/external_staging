
public class workers implements Runnable {
   public int tid;
   public int sindex;
   public int eindex;

   static int [] store;
   static long [] result;

   public void run() {
      for (int i = sindex; i < eindex; i++) {
         result[tid] += (long)(store[i]);
      }
      System.out.println("Thread " + tid + ": partial sum (" + sindex + ":" + eindex + ") = " + result[tid]);
   }

   public workers(int tid, int sindex, int eindex) {
      this.tid = tid;
      this.sindex = sindex;
      this.eindex = eindex;
   }

   public static void main(String [] args) {
       int size = 1024000000;
       int wcount = Integer.parseInt(args[0]);
       int slices = size / wcount;

       store = new int[size];
       result = new long[slices];

       for(int i = 0; i < store.length; i++) {
           store[i] = i;
       }
       Thread [] executers = new Thread[wcount];
       for (int i = 0; i < executers.length; i++) {
           executers[i] = new Thread(new workers(i, i*slices, i*slices + slices));
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < executers.length; i++) {
           executers[i].start();
       }
       try {
          for (int i = 0; i < executers.length; i++) {
              executers[i].join();
          }
       } catch (Exception e) {
          System.out.println(e);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[workers time] " + (t2 -t1) + " ms ");
       System.out.println("Main: Aggregating partial sum");
       t1 = System.currentTimeMillis();
       for (int i = 1; i < executers.length; i++) {
           result[0] +=  result[i];
       }
       t2 = System.currentTimeMillis();
       System.out.println("[main thread time] " + (t2 -t1) + " ms ");
       System.out.println("Main: Sum =  " + result[0]);
   }
}
