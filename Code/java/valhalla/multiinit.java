
import jdk.internal.vm.annotation.*;

abstract value class AbsLeafValue {}

@LooselyConsistentValue
@ImplicitlyConstructible
value class LeafValue extends AbsLeafValue {
   public int field1;
   public int field2;
   LeafValue(int f1, int f2) {
      this.field1 = f1;
      this.field2 = f2;
   }
}

abstract value class AbsMyValue {
   public static AbsLeafValue prepare(int [] arr) {
      LeafValue val = new LeafValue(arr[0], arr[1]);
      return val;
   }
}

value class MyValue extends AbsMyValue {
   @NullRestricted
   public LeafValue payload;

   MyValue(AbsLeafValue payload) {
       this.payload = (LeafValue)payload;
   }

   MyValue(int [] arr) {
      this(prepare(arr)); 
   }

   public String toString() {
      return "payload = [ " + payload.field1 + " , " + payload.field2 + " ] ";
   }
}

public class multiinit {
   public static MyValue micro1(int [] arr) {
       return new MyValue(arr);
   }
   public static MyValue micro2(int f1, int f2) {
       return new MyValue(new LeafValue(f1, f2));
   }
   public static void main (String [] args) {
      int [] arr = {10, 20};
      MyValue val = null;
      for (int i = 0; i < 100000; i++) {
          val = micro1(arr);
      }
      System.out.println(val);
      for (int i = 0; i < 100000; i++) {
          val = micro2(10, 20);
      }
      System.out.println(val);
   }
}
