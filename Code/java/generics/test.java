
import java.util.*;

class test {
   public static 
   <E extends Integer,
    L extends List<E>> 
   void printAll2(E obj, L list) {
     System.out.println(obj instanceof Object);
     //System.out.println(obj.getClass());
     //System.out.println(param[0]);
   }
 
   public static void main(String [] args) {
       //Integer [] arr = { Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3)};
       Long [] arr = { Long.valueOf(1), Long.valueOf(2), Long.valueOf(3)};
       test.printAll2(Integer.valueOf(10), Arrays.asList(arr));
       test.printAll2(null, null);
   }
}
