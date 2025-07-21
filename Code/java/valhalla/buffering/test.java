
abstract value class MyAbsValue {
   public abstract float getAccum();
}

value class MyValue extends MyAbsValue {
  public float f1; 
  public float f2;
  public MyValue(float f1, float f2) {
      this.f1 = f1;
      this.f2 = f2;
  }
  public float getAccum() {
      return this.f1 + this.f2;
  }
}


public class test {
  public static float leaf(MyAbsValue obj) {
      return obj.getAccum();
  }
  public static float micro(MyValue obj, int cond) {
      if (cond > 5000) {
         return leaf(obj); 
      }
      return obj.getAccum() + 10.0f;
  }   

  public static void main(String [] args) {
     float res = 0.0f;
     for (int i = 0; i < 10000; i++) {
         res += micro(new MyValue((float)i, 30.0f), i);
     }
     System.out.println("[res] " + res);
  }
}
