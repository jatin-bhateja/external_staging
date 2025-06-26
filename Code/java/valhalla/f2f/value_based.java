
import jdk.internal.ValueBased;

@jdk.internal.ValueBased
final class MyValue {
  final int field1;
  final int field2;
  final int field3;
  final int field4;
  MyValue(int f) {
     field1 = f;
     field2 = f;
     field3 = f;
     field4 = f;
  }
}

public class value_based {
   public static void main(String [] args) {
      System.out.println(MyValue.class.toString());
   }
}
