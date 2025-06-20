
import jdk.internal.vm.annotation.*;

@ImplicitlyConstructible
@LooselyConsistentValue
value class Payload {
   public float f1;
   public float f2;
   public Payload(float f1, float f2) {
       this.f1 = f1;
       this.f2 = f2;
   }
   public float getAccum() { 
       return this.f1 + this.f2;
   }
}

public class atomic_flat_field {
   @NullRestricted
   public Payload field;

   public float micro() {
       field =  new Payload(10.0f, 20.0f);
       return field.getAccum();
   } 
   
   public static void main(String [] args) {
       float res = 0.0f;
       atomic_flat_field obj = new atomic_flat_field();
       for (int i = 0; i < 100000; i++) {
           res += obj.micro(); 
       }
       System.out.println("[res] " + res);
   }
}
