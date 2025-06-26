

import jdk.internal.vm.annotation.MultiField;
import jdk.internal.misc.Unsafe;

value class DummyVectorPayload {
   static final Unsafe UNSAFE = Unsafe.getUnsafe();

   @MultiField(value = 4)
   int _value;

   DummyVectorPayload(int init) {
       UNSAFE.putInt(this, 12, init*10); // JLS restrics passing uninitialized 'this' pointer
       UNSAFE.putInt(this, 16, init*10); // as a call argument.
       UNSAFE.putInt(this, 20, init*10);
       UNSAFE.putInt(this, 24, init*10);
   }

   int getValue(int index) {
       assert index >= 0 && index <= 3;
       return UNSAFE.getInt(this, 12 + index * Integer.BYTES);
   }
}

public class mf_init {
   public static void main (String [] args)  {
       DummyVectorPayload obj = new DummyVectorPayload(10);
       System.out.println(obj.getValue(0));
       System.out.println(obj.getValue(1));
       System.out.println(obj.getValue(2));
   }
}

