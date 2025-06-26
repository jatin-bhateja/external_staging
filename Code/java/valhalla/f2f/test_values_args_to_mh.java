
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

value class MyValue {
//class MyValue {
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

public class test_values_args_to_mh {
  public static float micro(MyValue obj) {
     return obj.field1 + obj.field2 + obj.field3 + obj.field4;
  }
  public static float caller(float f) {
     MyValue obj = new MyValue(f);
     return micro(obj);
  }
  public static float mh_caller(float f) throws Throwable {
     MethodType mt = MethodType.methodType(float.class, float.class);
     MethodHandles.Lookup lookup = MethodHandles.lookup();
     MethodHandle mh = lookup.findStatic(test_values_args_to_mh.class, "caller", mt); 
     return (float)mh.invoke(f); 
  }
  public static float mh_micro(float f) throws Throwable {
     MethodType mt = MethodType.methodType(float.class, MyValue.class);
     MethodHandles.Lookup lookup = MethodHandles.lookup();
     MethodHandle mh = lookup.findStatic(test_values_args_to_mh.class, "micro", mt); 
     return (float)mh.invoke(new MyValue(f)); 
  }

  public static void main(String [] args) {
    try {
      float res = 0.0f;
      for (int i = 0; i < 100000; i++) {
         res += mh_caller((float)i);
      }
      System.out.println("[caller res] " + res);

      for (int i = 0; i < 100000; i++) {
         res += mh_micro((float)i);
      }
      System.out.println("[micro res] " + res);
    } catch (Throwable e) {
      System.out.println(e);
    }
  }
} 


