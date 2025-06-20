
class MyMonitor {
  int field1;
  int field2;
  MyMonitor(int f1, int f2) {
     this.field1 = f1;
     this.field2 = f2;
  }
}

public class identity_sync implements Runnable {
  public boolean readF;
  public static MyMonitor obj = new MyMonitor(10, 10);

  public identity_sync(boolean readF) {
     this.readF = readF;
  }
  public static int read () {
      int res = 0;
      synchronized(obj) {
          res = obj.field1 + obj.field2;
      }
      System.out.println("read value = " + res);
      return res;
  }

  public static void write (int val) {
      synchronized(obj) {
          obj.field1 = val;
          obj.field1 = val + 10;
      }
      System.out.println("wrote value = " + val);
  }
  public void run() {
      if (readF) read();
      else write(10);
  }
  public static void main(String [] args) {
      try {
        Thread reader = new Thread(new identity_sync(true));
        Thread writer = new Thread(new identity_sync(false));
        writer.start();
        reader.start();
        reader.join(); 
        writer.join();
     } catch (Exception e) {
        System.out.println(e);
     }
  }
} 
