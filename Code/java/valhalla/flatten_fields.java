
import jdk.internal.vm.annotation.*;

@ImplicitlyConstructible
value class Point {
   public float f1;
   public short f2;

   public Point(float f1, short f2) {
      this.f1 = f1;
      this.f2 = f2;
   }

   public float accum() {
      return f1 + (float)f2;
   }
}

public class flatten_fields {
   @NullRestricted
   public Point obj;

   public float micro(float val) {
       obj = new Point(val, (short)(val + 10.0f));
       return obj.accum();
   } 

   public static void main(String [] args) {
       float res = 0.0f;
       flatten_fields obj = new flatten_fields();
       for (int i = 0; i < 10000; i++) {
           res += obj.micro((float)i); 
       } 
       System.out.println("[res] " + res);
   }
}
