
import jdk.internal.misc.*;

value abstract  class MyAbsValue {
    
}

value class MyValue extends MyAbsValue {
    public float field1;
    public float field2;
    public float field3;
    public float field4;
    public MyValue(float f1, float f2, float f3, float f4) {
        this.field1 = f1;
        this.field2 = f2;
        this.field3 = f3;
        this.field4 = f4;
    }
    public float getAccum() { 
        return this.field1 + this.field2 + this.field3 + this.field4;
    }
}

public class test_osr_flow {
    public static Unsafe UNSAFE = Unsafe.getUnsafe();
   
    public static float micro(MyAbsValue obj) {
        obj = UNSAFE.makePrivateBuffer(obj);
        float res = 0.0f;
        for (int i = 0; i < 100000; i++) {
           res += UNSAFE.getFloat(obj, 12 + ((i * Float.BYTES) & 15)); 
           UNSAFE.putFloat(obj, 12 + ((i * Float.BYTES) & 15), res);
        }
        obj = UNSAFE.finishPrivateBuffer(obj);
        return res;
    } 
   
    public static void main(String [] args) {
        MyAbsValue obj = new MyValue(10.0f, 20.0f, 30.0f, 40.0f);
        System.out.println("[res] " + micro(obj));
    }
}
