
import jdk.internal.vm.annotation.*;


@NullRestrictedArray
@ImplicitlyConstructible
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

public class check_null_assignment {
  public static void test1() {
     ValueContainer obj = new ValueContainer(new MyValue(10));
     System.out.println(obj);
     // obj.field = null; // Final field cannot be initialized post construction.
     System.out.println(obj);
  }
  public static void test2(int i) {
      MyValue [] varr = new MyValue[16];
      // C2 will treat it as UCT and de-optimize, Interpreter will throw NPE.
      if (i == 15000) {
        varr[1] = null;
      }
  }
  public static void main(String [] args) {
     test1();
     for (int i = 0; i < 100000; i++) {
       test2(i);
     }
  }
}
