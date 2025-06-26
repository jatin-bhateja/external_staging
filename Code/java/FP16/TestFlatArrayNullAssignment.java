
import jdk.internal.vm.annotation.*;

@NullRestrictedArray
@ImplicitlyConstructible
@LooselyConsistentValue
value class MyValue {
   public int field;
   MyValue(int field_val) {
      field = field_val;
   }
}

value class ValueContainer {
  @NullRestricted
  public MyValue field;
  ValueContainer(MyValue field_val) {
     field = field_val;
  }
  public String toString() {
     return "field : " + field.field;
  }
}

public class TestFlatArrayNullAssignment {
  public static void test(int i) {
      MyValue [] varr = new MyValue[16];
      // C2 will treat it as UCT and de-optimize, Interpreter will throw NPE.
      if (i == 15000) {
          varr[1] = null;
      }
  }
  public static void main(String [] args) {
     try {
         for (int i = 0; i < 100000; i++) {
           test(i);
         }
         throw new AssertionError("NullPointerException Expected");
     } catch (NullPointerException e) {
         System.out.println(e);
         System.out.println("PASSED");
     }
  }
}
