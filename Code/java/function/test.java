

import java.util.function.BiFunction;

class test {
  public static boolean compare(Object a, Object b) {
     return compare(a, b, (x, y) -> x == y);
  } 
  public static boolean compare(Object a , Object b, BiFunction<Object,Object,Boolean> func) {
     return func.apply(a,b);
  }
  public static void main(String [] args) {
     boolean val1 =  compare(1, 2 ); 
     //boolean val2 =  compare(1.4242, 2.4242 , (a, b) -> { System.out.println(a.getClass() + " " + b.getClass()); return true;}); 
     boolean val2 =  compare(1.4242, 2.4242 , (a, b) -> Double.doubleToRawLongBits(((Double)a).doubleValue()) == Double.doubleToRawLongBits(((Double)b).doubleValue())); 
     System.out.println("res1 = " + val1);
     System.out.println("res2 = " + val2);
  }

}
