import jdk.internal.misc.Unsafe;

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


public class unsafe_bug {
   static final long[] OFFSETS = new long[] { 16, 24 };

   public static Vector helper(double[] values) {
      Vector obj = new Vector(new Payload(values[0], values[1]));
      Payload pobj = Unsafe.getUnsafe().makePrivateBuffer(obj.bstore);
      for (int i = 0; i < OFFSETS.length; i++) {
         Unsafe.getUnsafe().putDouble(pobj, OFFSETS[i], 20.0);
      }
      pobj = Unsafe.getUnsafe().finishPrivateBuffer(pobj);
      return new Vector(pobj);
   }


   public static double test(double[] values) {
      Vector p = helper(values);
      return p.bstore.d1 + p.bstore.d2;
   }

   public static void main(String[] args) {
      double[]  values = new  double[] {  1.0,   2.0 };
      double d = 0.0;
      for (int i = 0; i < 10000; i++) {
          d += test(values);
      }
      System.out.printf("test: %f\n", d);
   }
}

