

import java.util.concurrent.atomic.*;

class MyTask1  implements Runnable {
   public int iter;
    
   public MyTask1(int iter) {
      this.iter = iter;
   }

   public void run() {
      for(int i = 0; i < iter; i++)
         test.ctr.setRelease(i);
   }
}

class MyTask2  implements Runnable {
   public int iter;
    
   public MyTask2(int iter) {
      this.iter = iter;
   }

   public void run() {
      for(int i = 0; i < iter; i++)
         test.incrCtr();
   }
}

public class test {
  public static AtomicInteger ctr;

  public static int incrCtr() {
     return ctr.incrementAndGet();
  }

  public static void main(String [] args) {
     ctr = new AtomicInteger(0);
     MyTask1 tsk1 = new MyTask1(20);
     MyTask2 tsk2 = new MyTask2(20);
     for (int i = 0 ; i < 1000000 ; i++) {
       Thread t1 = new Thread(tsk1);
       Thread t2 = new Thread(tsk2);

       t1.start();
       t2.start();

       try {
         t1.join();
         t2.join();
       } catch(InterruptedException e) {

       }
     }
     System.out.println("ctr = " + ctr.get());
  }
}
