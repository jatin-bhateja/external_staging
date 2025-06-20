

value class MyValue {
  float field1;
  float field2;
  float field3;
  float field4;
  MyValue (float field) {
     field1 = field + 10.0f;
     field2 = field + 20.0f;
     field3 = field + 30.0f;
     field4 = field + 40.0f;
  } 
}

public class test_values {
   public static float micro (MyValue obj) {
      return obj.field1 * obj.field2 - obj.field3 + obj.field4;
   }
   public static float caller(float val) {
      MyValue obj = new MyValue(val);
      return micro(obj);
   }
   public static void main(String [] args) {
      float res = 0.0f; 
      for (int i = 0; i < 10000; i++) {
          res += caller((float)i);
      }
      System.out.println("[res] " + res);
   }
} 
