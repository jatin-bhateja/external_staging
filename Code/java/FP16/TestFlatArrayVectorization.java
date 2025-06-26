import java.util.Random;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.NullRestrictedArray;
import jdk.internal.vm.annotation.LooselyConsistentValue;

@ImplicitlyConstructible
@NullRestrictedArray
@LooselyConsistentValue
value class SimpleValue {
   int field;
   public SimpleValue(int field) {
      this.field = field;
   }
}

public class TestFlatArrayVectorization {
   public static SimpleValue [] varr;
   public static final int SIZE = 2048;
   public static final int SIZE_M1 = SIZE - 1;
   public static Random rd = new Random(2048);

   public static int test() {
      varr = new SimpleValue [SIZE];
      for (int i = 0; i < varr.length; i++) {
          varr[i] = new SimpleValue(i);
      }
      return varr[rd.nextInt(2047)].field;
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000; i++) {
          res += test();
      }
      System.out.println("[res] " + res);
   }
}
