

import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.NullRestricted;

@ImplicitlyConstructible
@LooselyConsistentValue
value class MyFlatPayload {
   int f1;
   int f2;
   int f3;
   int f4;
   MyFlatPayload(int init) {
      this.f1 = init + 10;
      this.f2 = init + 20;
      this.f3 = init + 30;
      this.f4 = init + 40;
   }
} 


public value class flat_fields_initialization {
   @NullRestricted
   MyFlatPayload _ffield;
   
   flat_fields_initialization(int init) {
      _ffield = new MyFlatPayload(10);
   }

   public static void main (String [] args) {
      flat_fields_initialization obj = new flat_fields_initialization(10);
      System.out.println(obj._ffield.f1);
   }
}
