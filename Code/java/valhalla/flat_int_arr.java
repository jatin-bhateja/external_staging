
import jdk.internal.vm.annotation.*;

@ImplicitlyConstructible
@LooselyConsistentValue
value class ABC {
   int field;
   public ABC(int field) {
      this.field = field;
   }
}

public class flat_int_arr {
   public static ABC [] farr;
   public static final int SIZE = 16;
   public static final int SIZE_M1 = SIZE - 1;

   public static int micro(int ctr) {
      farr = new ABC [SIZE];    // ANEWARRAY
      for (int i = 0; i < farr.length; i++) {
          farr[i] = new ABC(i); // AASTORE
      }
      return farr[ctr].field;   
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i & SIZE_M1);
      }
      System.out.println("[res] " + res);
   }
}
