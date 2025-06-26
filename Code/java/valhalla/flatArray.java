
import jdk.internal.vm.annotation.*;

@LooselyConsistentValue
@NullRestrictedArray
@ImplicitlyConstructible
value class ABC {
   int field;
   public ABC(int field) {
      this.field = field;
   }
}

public class flatArray {
   public static final int SIZE = 1000;
   public static ABC [] farr = new ABC [SIZE];    // ANEWARRAY
   public static final int SIZE_M1 = SIZE - 1;

   public static int micro(int ctr) {
      for (int i = 0; i < farr.length; i++) {
          farr[i] = new ABC(i); // AASTORE
      }
      return farr[ctr].field;   
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000000; i++) {
          res += micro(i & SIZE_M1);
      }
      System.out.println("[res] " + res);
   }
}
