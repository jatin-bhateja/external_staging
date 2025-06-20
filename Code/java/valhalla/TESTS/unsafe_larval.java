

import jdk.internal.misc.Unsafe;

value class MyClass {
  float px;
  float py;
  float pz;
  public MyClass(float vx, float vy, float vz) {
     this.px = vx;
     this.py = vy;
     this.pz = vz;
  }
  public float accum() { return px + py + pz; }
}

public class unsafe_larval {
  public static final Unsafe UNSAFE = Unsafe.getUnsafe();

  public static MyClass transform(MyClass point, float ix, float iy, float iz, int iter) {
      MyClass obj = new MyClass(ix, iy, iz);
      obj = UNSAFE.makePrivateBuffer(obj);
      if (iter == 50000) {
         // Uncommon trap
         UNSAFE.putFloat(obj, 12, 40.0f);
         UNSAFE.putFloat(obj, 16, 50.0f);
         UNSAFE.putFloat(obj, 20, 60.0f);
         obj = UNSAFE.finishPrivateBuffer(obj);
         return obj;
      }
      UNSAFE.putFloat(obj, 12, ix);
      UNSAFE.putFloat(obj, 16, iy);
      UNSAFE.putFloat(obj, 20, iz);
      obj = UNSAFE.finishPrivateBuffer(obj);
      return obj;
  }
  
  public static void main(String [] args) {
      MyClass obj = new MyClass(0.0f, 0.0f, 0.0f);
      for (int i = 0; i < 100000; i++) {
          obj = transform(obj, i, i + 10.0f, i + 20.0f, i);
      }
      System.out.println("[res] " + obj.accum());
  }
}
