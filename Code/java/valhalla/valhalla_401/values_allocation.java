
import jdk.internal.vm.annotation.*;
import jdk.internal.misc.*;

@LooselyConsistentValue
abstract value class ValuePayloadBase {
}

@LooselyConsistentValue
value class ValuePayload extends ValuePayloadBase {
   @MultiField(value=2)
   public double _mfield;
   ValuePayload(double init) {
      _mfield = init;
   }
}

value class DoubleVector {
   public static final Unsafe U = Unsafe.getUnsafe();

   @NullRestricted
   @Strict
   public ValuePayload _payload;
   
   DoubleVector(ValuePayloadBase payload) {
      _payload = (ValuePayload)payload;
   }

   static boolean compare(DoubleVector vec1, DoubleVector vec2) {
      boolean res = true;
      for (int i = 0; i < 2; i++) {
          double v1 = U.getDouble(vec1._payload, 16 + i * Double.BYTES);
          double v2 = U.getDouble(vec2._payload, 16 + i * Double.BYTES);
          res &= v1 == v2;
      }
      return res;
   }
}

public class values_allocation {
   public static boolean micro(double d1, double d2) {
       return DoubleVector.compare(new DoubleVector(new ValuePayload(d1)), new DoubleVector(new ValuePayload(d2)));
   }

   public static void main(String [] args) {
       boolean res = true;
       for (int i = 0; i < 100000; i++) {
           res &= micro((double)i, (double)i);
       }
       System.out.println("[res] " + res);
   }
}
