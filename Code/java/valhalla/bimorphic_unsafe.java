
import jdk.internal.misc.Unsafe;


abstract class Payload {
}

primitive class Payload64 extends Payload {
   public int field1;
   public int field2;

   public Payload64 (int val) {
      this.field1 = val;
      this.field2 = val + 10;
   }
}

primitive class Payload128 extends Payload {
   public int field1;
   public int field2;
   public int field3;
   public int field4;

   public Payload128 (int val) {
      this.field1 = val;
      this.field2 = val + 40;
      this.field3 = val + 50;
      this.field4 = val + 60;
   }
}

abstract class TopPayload {
  public static final Unsafe UNSAFE = Unsafe.getUnsafe();
  public int getVal(Payload obj, int idx) {
     return  UNSAFE.getInt(obj, 12 +  4 * idx);
  }
}

value class TopPayload64 extends TopPayload {
  public Payload64 obj;
  public TopPayload64(Payload obj) {
     this.obj = (Payload64)obj;
  }
}

value class TopPayload128 extends TopPayload {
  public Payload128 obj;
  public TopPayload128(Payload obj) {
     this.obj = (Payload128)obj;
  }
}

public class bimorphic_unsafe {
  public static final Unsafe UNSAFE = Unsafe.getUnsafe();

   public static int micro(int obj_idx, int idx) {
       Payload pobj   = (obj_idx == 1) ? new Payload64(10) : new Payload128(10);
       return  UNSAFE.getInt(pobj, 12 +  4 * idx);
       //TopPayload obj = (obj_idx == 1) ? new TopPayload64(pobj) : new TopPayload128(pobj);
       //return obj.getVal(pobj, 1);
   }

   public static void main(String [] args) {
       int res =  0;
       for (int i = 0; i < 1000; i++) {
          res += micro(i & 1, 1);
       }
       System.out.println(res);
   }
} 
