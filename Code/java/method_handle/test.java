import java.lang.invoke.*;

class MyClass {
   public static Integer hashCode(int a, int b, int c) {
      return a * 10 + b * 100 + c * 1000;
   }
}

public class test {
   public static void main(String [] args) {
       long res = 0;
       try {
          for (int i = 0; i < 100000; i++) {
              res += micro(i, i + 10, i + 20);
          }
       } catch (Throwable e) {
          System.out.println(e);
       }
       System.out.println("[res] " + res);
   }
   public static int micro(int a, int b, int c) throws Throwable {
       MethodHandles.Lookup lup = MethodHandles.lookup();
       MethodType mt = MethodType.methodType(Integer.class, int.class, int.class, int.class);
       MethodHandle mh = lup.findStatic(MyClass.class, "hashCode", mt); 
       return  ((Integer)mh.invokeExact(a, b, c)).intValue();
   }
}
