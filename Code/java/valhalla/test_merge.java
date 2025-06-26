
import jdk.internal.misc.*;

primitive class Payload {
   public double value1;
   public double value2;
   public Payload(double value1, double value2) {
      this.value1 = value1;
      this.value2 = value2;
   }
}

public class test_merge {
   public static boolean [] mask = {true, true};
   public static Unsafe UNSAFE = Unsafe.getUnsafe();
   public static Payload leaf(boolean [] mask) {
       Payload p1 = new Payload(0.0, 0.0);
       p1 = UNSAFE.makePrivateBuffer(p1);
       for (int i = 0; i < 2; i++) {
           if (mask[i]) {
               UNSAFE.putDouble(p1, 16, 30.0);
           }
       }
       p1 = UNSAFE.finishPrivateBuffer(p1);
       return p1;
   }
   public static double micro(boolean [] mask) {
       Payload p1 = leaf(mask); 
       return p1.value1 + p1.value2;
   }
   public static void main(String [] args) {
       double res = 0.0;
       for (int i = 0; i < 100000; i++) {
           res += micro(mask);
       }
       System.out.println(res);
   }
}
