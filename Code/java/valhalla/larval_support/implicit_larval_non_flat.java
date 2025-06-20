
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.misc.Unsafe;

@ImplicitlyConstructible
@LooselyConsistentValue
value class value_type {
  public static Unsafe U = Unsafe.getUnsafe();
 
  long f1;
  long f2;

  public value_type(long f1, long f2) {
      this.f1 = f1;
      this.f2 = f2;
      if (f1 < 0) {
         System.out.println("I got depoptimized.");
         //U.putLong(this, 16, 10);
      } 
      super();
  }

  public long accum() {
      return this.f1 + this.f2;
  }
}

public class implicit_larval_non_flat {
   //@NullRestricted
   // static fields are never flattened.
   public value_type field1;

   public long micro(long a) {
       field1 = new value_type(a, a + 10);
       return field1.accum();
   }
  
   public static void main(String [] args) {
       long res = 0;
       implicit_larval_non_flat obj = new implicit_larval_non_flat();
       for (int i = 0 ; i < 10000; i++) {
           res += obj.micro(i); 
       }
       res += obj.micro(-1);
       System.out.println("[res] " + res);
   }
}
