
value class Payload {
   public double field1;
   public double field2;
   public double field3;
   public double field4;
   public Payload(double val) {
      this.field1 = val + 10.0;
      this.field2 = val + 20.0;
      this.field3 = val + 30.0;
      this.field4 = val + 40.0;
   }
   public double getAccVal () {
      return this.field1 + this.field2 + this.field3 + this.field4;
   }
}

value class Vector {
   public Payload obj;
   public Vector(Payload obj) {
       this.obj = obj;  // non-flat field, must be buffered (withfield)
   }
   public double getPayloadAccVal() { return obj.getAccVal(); }  
}

public class eliminate_allocation {
   public static double micro(double val) {
      Vector vec = new Vector(new Payload(val));
      return vec.getPayloadAccVal();  // scalarization, buffer elimination.
   }
   public static void main(String [] args) {
      double res = 0.0;
      for (int i = 0; i < 100000; i++) {
         res += micro((double)i);
      }
      System.out.println("[res] " + res);
   }
} 
