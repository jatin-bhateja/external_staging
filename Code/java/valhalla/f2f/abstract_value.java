
abstract value class TopValue {}

abstract value class AbsValue extends TopValue {}

value class MyVal extends AbsValue {}

public class abstract_value {
   public static void main(String [] args) {
      AbsValue obj = new MyVal();
      System.out.println(obj.hashCode());
   }
}
