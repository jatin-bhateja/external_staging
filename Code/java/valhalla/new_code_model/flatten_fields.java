
import jdk.internal.vm.annotation.*;

@LooselyConsistentValue
value class Point {
   public float f1;
   public float f2;
   public float f3;
   public float f4;
   public long f5;

   public Point(float f1, long f2) {
      this.f1 = f1;
      this.f2 = f1;
      this.f3 = f1;
      this.f4 = f1;
      this.f5 = f2;
   }

   public float accum() {
      return f1 * 4 + (float)f5;
   }
}

public class flatten_fields {
   @Strict
   @NullRestricted
   public Point obj;

   flatten_fields(float val) {
      obj = new Point(val, (long)(val + 10.0f));
   }

   public float micro(float val) {
       return obj.accum();
   } 

   public static void main(String [] args) {
       float res = 0.0f;
       flatten_fields obj = new flatten_fields(10.0f);
       for (int i = 0; i < 10000; i++) {
           res += obj.micro((float)i); 
       } 
       System.out.println("[res] " + res);
   }
}
