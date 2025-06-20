
import jdk.internal.misc.Unsafe;

primitive class VectorPayload128D  {
   public double f1;
   public double f2;

   public VectorPayload128D() {
      this.f1 = 0.0;
      this.f2 = 0.0;
   }
   public VectorPayload128D(double f1, double f2) {
      this.f1 = f1;
      this.f2 = f2;
   }
   public double reduce() { return f1 + f2;}
}

public class  unsafe_loop_access {
   public static final Unsafe UNSAFE = Unsafe.getUnsafe();
   public static boolean [] cond = {true, false};
   public static long f1_offset;

   public static void main(String [] args) {
      double res = 0;
      try {
         f1_offset = UNSAFE.objectFieldOffset(VectorPayload128D.class.getDeclaredField("f1"));
         for (int i = 0; i < 100000; i++) {
             res += micro((double)i).reduce();
         }
         System.out.println(res);
      } catch (Exception e) {
         System.out.println(e);
      }
   }

   public static VectorPayload128D micro(double val) throws Exception {
      VectorPayload128D vector = new VectorPayload128D();
      vector = UNSAFE.makePrivateBuffer(vector);
      for (int i = 0; i < 2; i++) {
          if (cond[i]) {
              UNSAFE.putDouble(vector, f1_offset, UNSAFE.getDouble(vector, f1_offset) + 10);
          }
      }
      return UNSAFE.finishPrivateBuffer(vector);
   }
} 
