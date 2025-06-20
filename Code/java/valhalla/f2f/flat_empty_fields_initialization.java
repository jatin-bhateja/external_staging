

import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.NullRestricted;

@ImplicitlyConstructible
@LooselyConsistentValue
value class MyFlatPayload {
} 


public value class flat_empty_fields_initialization {
   @NullRestricted
   MyFlatPayload [] _ffield;
   
   flat_empty_fields_initialization(int init) {
      _ffield = new MyFlatPayload[100000];
      for (int i = 0; i < 1000000; i++) {
        _ffield[i] = new MyFlatPayload();
      }
   }

   public static void main (String [] args) {
      flat_empty_fields_initialization obj = new flat_empty_fields_initialization(10);
      System.out.println(obj._ffield.toString());
   }
}
