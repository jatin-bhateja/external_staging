
import jdk.internal.misc.Unsafe;

abstract class topValue {
}

value class dummyValue1 extends topValue {
   int field;
   public dummyValue1(int val) {
      field = val;
   }
}

value class dummyValue2 extends topValue {
   int field;
   public dummyValue2(int val) {
      field = val;
   }
}

public class Test8314190 {
   public static final Unsafe UNSAFE = Unsafe.getUnsafe();

   public static int getUnsafeFieldValue(topValue obj, int incr) {
       return UNSAFE.getInt(obj, 12) + incr;
   }

   public static int test(topValue obj) {
       int val = 0;
       if (obj.getClass() != dummyValue1.class) {
           val += 10;
       } else if (obj.getClass() != dummyValue2.class) {
           val += 20;
       }
       return getUnsafeFieldValue(obj, val);
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 10000; i++) {
           res += test((i % 1000) == 1 ? new dummyValue1(i) : new dummyValue2(i));
       }
       System.out.println(res);
   }
}
