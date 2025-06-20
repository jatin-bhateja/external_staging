
import jdk.internal.misc.*;
import jdk.internal.vm.ci.*;

public class internal_access {
   public static Unsafe UNSAFE = Unsafe.getUnsafe();
   public static void main (String [] args) {
      System.out.println(UNSAFE);
   }
}
