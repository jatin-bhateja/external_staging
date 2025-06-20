
import java.lang.reflect.*;

class MyClass {
   public static double func(double a, double b) {
       return Math.pow(a, b);
   }
}

public class test {
   public static void main(String [] args) throws Exception {
       int algo = Integer.parseInt(args[0]);
       if (algo == 0) {
           double res = 0.0;
           var m = MyClass.class.getDeclaredMethod("func", double.class, double.class);
           for (int i = 0; i < 1000000; i++) {
               res += (double)m.invoke(null, 10.0, 2.0);  
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 1000000; i++) {
               res += (double)m.invoke(null, 10.0, 2.0);  
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time reflective invocation] " + (t2 - t1) + "ms [res] " + res);
       } else {
           double res = 0.0;
           // Resolved at compile time and compile inlines the callee.
           for (int i = 0; i < 1000000; i++) {
               res += MyClass.func(10.0, 2.0);  
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 1000000; i++) {
               res += MyClass.func(10.0, 2.0);  
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time direct invocation] " + (t2 - t1) + "ms [res] " + res);
       }
   }
}
