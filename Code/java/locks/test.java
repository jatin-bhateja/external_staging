

public class test implements Runnable {
   public static int count = 100;

   public int res; 
   public String type;

   public test(String type) {
       this.type = type;
       this.res = 0;
   }

   public synchronized void inc_counter() {
       count++;
   }
 
   public synchronized int get_counter() {
       return count;
   }

   public void run() {
       if (type == "Reader") {
           res = get_counter();
       } else {
           inc_counter();
       }
   }

   public static int micro(int tcount) {
       try {
           int res = 0;
           Thread[] workers = new Thread[tcount];
           test[] work = new test[tcount];
           for (int i = 0; i < tcount; i++) {
               work[i] = new test(((i & 1) ==  0) ? "Reader" : "Writer");
               workers[i] = new Thread(work[i]);
               workers[i].start();
           }
           for (int i = 0; i < tcount; i++) {
               // Interning
               if (work[i].type == "Reader") {
                  res += work[i].res; 
               }
           }
           for (int i = 0; i < tcount; i++) {
               workers[i].join();
           }
           return res;
       } catch (Exception e) {
           System.out.println(e);
       }
       return 0;
   }

   public static void main(String [] args) {
       long res = 0;
       int tcount = Integer.parseInt(args[0]);       
       for (int i = 0; i < 10000; i++) {
           res += micro(tcount);
       }
       System.out.println("[res] " + res);
   }
}
