
import jdk.internal.misc.Unsafe;

abstract class topValue {
   public abstract int getField();
   public abstract int setField();
}

value class dummyValue1 extends topValue {
   int field;
   public dummyValue1(int val) {
      field = val;
   }
   public int getField() {
      return field;
   }
   public void setField(int val) {
      return field = val * 10;
   }
}

value class dummyValue2 extends topValue {
   int field;
   public dummyValue2(int val) {
      field = val;
   }
   public int getField() {
      return field;
   }
   public void setField(int val) {
      return field = val * 20;
   }
}

public class Test8314190 {
   public static final Unsafe UNSAFE = Unsafe.getUnsafe();

   public static int getUnsafeFieldValue(topValue obj) {
       return UNSAFE.getInt(obj, 12) + val;
   }

   public static int test(topValue obj) {
       if (obj.getClass() != dummyValue1.class) {
           obj.setField(10);
       } else if (obj.getClass() != dummyValue2.class) {
           obj.setField(30);
       }
       return getUnsafeFieldValue(obj);
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 10000; i++) {
           res += test((i % 1000) == 1 ? new dummyValue1(i) : dummyValue2(i));
       }
       System.out.println(res);
   }
}
