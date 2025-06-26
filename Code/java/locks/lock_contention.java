
import java.util.concurrent.*;

public class lock_contention implements Runnable {
   public long result = 0;
   public boolean reader;
   public long invocation;

   public static long shared_counter = 0;
   public static boolean exec = true;

   public synchronized long reader() {
      return shared_counter;  
   }

   public synchronized void writer() {
      shared_counter++;
   }

   public lock_contention(boolean reader) {
       this.reader = reader;
   }

   public void run() {
       while(exec) {
           invocation++;
           if (reader) {
              result = reader();
           } else {
              writer();
           }
           if (result > 100000000L) {
              exec = false;
           }
       }
   }

   public static void main(String [] args) throws Exception {
      lock_contention whandle = new lock_contention(false);
      lock_contention rhandle = new lock_contention(true);
      Thread rthread = new Thread(whandle);
      Thread wthread = new Thread(rhandle);
      wthread.start(); 
      rthread.start(); 
      wthread.join();  
      rthread.join();  
      System.out.println("[rcounter] = " + rhandle.invocation);
      System.out.println("[wcounter] = " + whandle.invocation);
      System.out.println("[result] = " + rhandle.result);
   }
}
