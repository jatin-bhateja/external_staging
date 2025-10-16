
value class MyValue {
   public float f1;
   public float f2;
   public float f3;
   public float f4;
   public MyValue(float f1, float f2, float f3, float f4) {
       this.f1 = f1;
       this.f2 = f2;
       this.f3 = f3;
       this.f4 = f4;
   }
}

public class new_code_model_validation {
   public static float micro(float f) {
       MyValue obj1 = new MyValue(0.0f, 1.0f, 2.0f, 3.0f);
       MyValue obj2 = new MyValue(obj1.f1, 3.0f, obj1.f3, obj1.f4);
       return obj2.f1 + obj2.f2 + f;
   }

   public static void main(String [] args) {
       float res = 0.0f;
       for (int i = 0; i < 100000; i++) {
           res += micro((float)i);
       }
       System.out.println("[res] " + res);
   }
}
