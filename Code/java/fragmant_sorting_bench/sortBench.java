
import java.util.Arrays;
import java.util.Random;

public class sortBench implements Runnable {
  public static float [] arr;
  public int start;
  public int end;

  public sortBench(int start, int end) {
     this.start = start;
     this.end = end;
  }
   
  public void run() {
     float [] temp = new float[end - start];
     System.arraycopy(arr, start, temp, 0, end - start);
     Arrays.sort(temp);
     System.arraycopy(temp, 0, arr, start, temp.length);
  } 
 
  public static void main(String [] args) {
     int size = Integer.parseInt(args[0]);
     int threads  = Integer.parseInt(args[1]);
     int iters = Integer.parseInt(args[2]);
     int slice = size / threads;

     try { 
         Random rand = new Random(1023);
         arr = new float[size];
    
         System.out.println("Starting " + iters + " iterations of fragment sorting for "  + size + " elements array with " + threads + " threads..");
         Thread [] workers = new Thread[threads]; 
         
         long t1 = System.currentTimeMillis();
         for (int iter = 0; iter < iters; iter++) {
            for (int i = 0; i < arr.length; i++ ) {
               arr[i] = rand.nextFloat();
            }
            for (int i = 0; i < workers.length; i++) {
               workers[i] = new Thread(new sortBench(i*slice, i*slice + slice));
               workers[i].start();
            }
            for (int i = 0; i < workers.length; i++) {
               workers[i].join();
            }
         }
         long t2 = System.currentTimeMillis();
    
         System.out.println("[time] " +  (t2-t1) + " ms ");
     } catch (Exception e) {
        System.out.println(e);
     }
  }
}
