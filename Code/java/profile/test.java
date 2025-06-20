
abstract class BaseObj {}

class DerivedObj1 extends BaseObj {}
class DerivedObj2 extends BaseObj {}
class DerivedObj3 extends BaseObj {}
class DerivedObj4 extends BaseObj {}

public class test {
   public static int micro1(BaseObj obj) {
       if (obj.getClass() == DerivedObj1.class) {
         return ((DerivedObj1)obj).hashCode();
       } else if (obj.getClass() == DerivedObj2.class) {
         return ((DerivedObj2)obj).hashCode();
       } else if (obj.getClass() == DerivedObj3.class) {
         return ((DerivedObj3)obj).hashCode();
       } else if (obj.getClass() == DerivedObj4.class) {
         return ((DerivedObj4)obj).hashCode();
       } else {
         return -1;
       }
   }
   public static void main (String [] args) {
       int res = 0;
       BaseObj [] oarr = {new DerivedObj1(), new DerivedObj2(), new DerivedObj3(), new DerivedObj4()};
       for (int i = 0; i < 10000; i++) {
           res += micro1(oarr[i & 3]); 
       }
       System.out.println(res);
   }
}
