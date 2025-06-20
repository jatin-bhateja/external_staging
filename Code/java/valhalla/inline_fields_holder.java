
value class payload {
   long f1;
   long f2;
   long f3;
   long f4;
   public payload(long f1, long f2, long f3, long f4) {
      this.f1 = f1;
      this.f2 = f2;
      this.f3 = f3;
      this.f4 = f4;
   }
}

public class inline_fields_holder implements Runnable {
   public int index;
   public boolean reader;

   public payload lf;
   public static inline_fields_holder root = new inline_fields_holder();

   public inline_fields_holder() {
      lf = new payload(0, 10, 20, 30);
   }

   public inline_fields_holder(boolean reader, int index) {
      this.index = index;
      this.reader = reader;
      lf = new payload(0, 10, 20, 30);  // reference update is atomic on x86.
   }

   public /*synchronized*/ void read () {
      if ((root.lf.f2 - root.lf.f1) != 10) {
         throw new AssertionError("Non-atomic write/read");
      }
      if ((root.lf.f4 - root.lf.f3) != 10) {
         throw new AssertionError("Non-atomic write/read");
      }
   }

   public /*synchronized*/ void write() {
      root.lf = new payload(index, index + 10, index + 20, index + 30);
                                              // Identity payload is escaping to global reference, ref write is 32 bit
                                              // store operation (compressed oops), x86
      index += 10;                            // implicitly guarantees atomic update of reference.
                                              // Making payload a value object will result into field level update.
   }

   public void run() {
      if (reader) {
         read();
      } else {
         write();
      }
   }

   public static void main(String [] args) {
      long res = 0;
      inline_fields_holder reader = new inline_fields_holder(true, 0); 
      inline_fields_holder writer  = new inline_fields_holder(false, 0); 
      Thread rthread = null;
      Thread wthread = null;
      for (int i = 0; i < 10000; i++) {
             wthread = new Thread(writer);
             rthread = new Thread(reader);
             wthread.start();
             rthread.start();
      }
      try {
        rthread.join();
        wthread.join();
      } catch (Exception e) {
        System.out.println(e);
      }
      System.out.println("Main Exiting");
   }
}
