

import java.util.concurrent.atomic.*;

public class test1 {
  public static AtomicInteger ctr;

  public static void micro(int val) {
     ctr.setRelease(val);
  }

  public static void main(String [] args) {
     ctr = new AtomicInteger(0);
     for (int i = 0 ; i < 1000000 ; i++) {
        micro(i);
     }
     System.out.println("ctr = " + ctr.get());
  }
}
