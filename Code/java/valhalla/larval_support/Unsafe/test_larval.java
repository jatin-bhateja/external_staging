
import jdk.internal.misc.*;

value class MyValue {
   public int field1;
   public int field2;
   public MyValue(int field1, int field2) {
      this.field1 = field1;
      this.field2 = field2;
   }
   public int accumFields() {
      return field1 + field2;
   }
}

public class test_larval  {
   public static MyValue micro(int field1, int field2) {
      MyValue obj = null;
      if (field1 > field2) {
         obj = new MyValue(field1, field2); 
      } else {
         obj = new MyValue(field2, field1);
      }
      return obj;
   }

   public static void main (String [] args) {
      MyValue obj = micro(10, 20);

      System.out.println("obj => " + obj);
      System.out.println("field1 => " + obj.field1);
   }
}
