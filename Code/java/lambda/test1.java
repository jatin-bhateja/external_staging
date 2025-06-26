
import java.util.function.*;
import java.lang.reflect.*;

class test {
  public int a;
  public static int capturingLambda(int a, Function<Integer,Integer> f) {
     System.out.println("Function ClassName: "+  f.getClass().getName());
     System.out.println("Function fields: "+  f.getClass().getDeclaredFields().length);
     for (Field fld : f.getClass().getDeclaredFields()) {
       System.out.println("Field Name: "+  fld.getName());
     }
     return f.apply(a);
  }
  public int caller(int a) {
     return capturingLambda(a, (Integer b) -> { return b + b;});
  } 
  public static void main(String [] args) {
     test obj = new test();
     System.out.println("Res = " + obj.caller(20));
  }
}
