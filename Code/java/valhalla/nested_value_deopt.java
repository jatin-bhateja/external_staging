
// lworld+vector - crash - merge.

value class Payload {
  public double d1, d2;
  public Payload(double d1, double d2) {
    this.d1 = d1;
    this.d2 = d2;
  }
}

value class Vector {
  public Payload bstore;
  public Vector(Payload obj) {
     this.bstore = obj;
  }
}


public class nested_value_deopt {
   public static Vector helper(Vector obj, int idx) {
      if (idx == 500000) {
         throw new AssertionError("Reached idx");
      }
      return new Vector(new Payload(obj.bstore.d1 + 10.0, obj.bstore.d2 + 10.0));
   }

   public static double test(double[] values, int idx) {
      Vector p = new Vector(new Payload(values[0], values[1]));
      p = helper(p, idx);
      return p.bstore.d1 + p.bstore.d2;
   }

   public static void main(String[] args) {
      double[]  values = new  double[] {  1.0,   2.0 };
      double d = 0.0;
      for (int i = 0; i < 10000000; i++) {
          d += test(values, i);
      }
      System.out.printf("test: %f\n", d);
   }
}
