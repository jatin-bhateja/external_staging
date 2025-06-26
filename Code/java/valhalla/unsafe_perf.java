
import jdk.internal.misc.*;

primitive class Payload {
   double vpayload = 0.0;
   double vpayload1 = 0.0;

   public static final Unsafe U = Unsafe.getUnsafe();

   public Payload() {
   }

   static double reduce1(Payload dst, double [] src) {
       Payload tmp = dst;
       for (int i = 0; i < 2; i++) {
           tmp = U.makePrivateBuffer(tmp);
           U.putDouble(tmp, 16 + i * 8, src[i]);
           tmp = U.finishPrivateBuffer(tmp); 
       }
       dst = tmp;
       return U.getDouble(dst, 16) + U.getDouble(dst, 24);
   }
   
   static double reduce2(double [] dst, double [] src) {
       for (int i = 0; i < 2; i++) {
          dst[i] = src[i];
       }
       return dst[0] + dst[1];
   }
}

public class unsafe_perf {
   public static final Unsafe U = Unsafe.getUnsafe();

   public static double micro1(Payload dst, double [] src) {
       double res = 0.0;
       for (int i = 0; i < 1000000; i++) {
           res += Payload.reduce1(dst, src);
       }
       return res;
   }

   public static double micro2(double [] dst, double [] src) {
       double res = 0.0;
       for (int i = 0; i < 1000000; i++) {
           res += Payload.reduce2(dst, src);
       }
       return res;
   }

   public static void main(String [] args) {
       double [] src = {1.0, 2.0};
       double [] dst = new double[2];
       double res = micro2(dst, src);
       long t1 = System.currentTimeMillis();
       res = micro2(dst, src);
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res array] " + res);
       res = micro1(Payload.default, src);
       t1 = System.currentTimeMillis();
       res = micro1(Payload.default, src);
       t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res primtype] " + res);
   }
}

