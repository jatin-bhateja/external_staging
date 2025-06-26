
//import jdk.internal.vm.annotation.*;

//@ImplicitlyConstructible
//@LooselyConsistentValue
value class ValueBundle {
   double field1;
   double field2;
   double field3;
   double field4;
   public ValueBundle(double val)  {
      field1 = val + 10.0;
      field2 = val + 20.0;
      field3 = val + 30.0;
      field4 = val + 40.0;
   }
   public double accumulate() {
      return field1 + field2 + field3 + field4; 
   }
}

public class static_call_value {
   // inline_entry:
   //   if (obj1.mark.is_larval) {
   //      mov Reason_for_deopt(larval), %ebx
   //      call uncommon_trap_blob_addr();
   //   } 
   //   if (obj2.mark.is_larval) {
   //      mov Reason_for_deopt(larval), %ebx
   //      call uncommon_trap_blob_addr();
   //   } 
   //
   //public static double unsafe_micro(ValueBundle obj1, ValueBundle obj2) {
   // .. Unsafe.put () // to test in larval.
   // return Unsafe.get() +  .....;
   //}

   public static double micro(ValueBundle obj) {
      return obj.accumulate();
   }
   public static double test(int i) {
      return  micro(new ValueBundle((double)i));
   }
   public static void main (String [] args) {
      double res = 0.0;
      for (int i = 0; i < 100000; i++ ) {
         res += test(i);
      }
      System.out.println("[res] " + res);
   }
}
