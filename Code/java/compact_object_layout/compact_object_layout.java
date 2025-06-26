class MyClass {
   public float fld1;
   public float fld2;
   public float fld3;
   public float fld4;

   MyClass (float val) {
      fld1 = val;
      fld2 = val + 20.0f;
      fld3 = val + 30.0f;
      fld4 = val + 40.0f;
   }

   float getField(int idx) {
      switch(idx) {
         case 1 : return fld1;
         case 2 : return fld2;
         case 3 : return fld3;
         case 4 : return fld4;
         default : assert false;
      }
      return Float.MAX_VALUE;
   }
   float accumFields() {
      return fld1 + fld2 + fld3 + fld4;
   }
}

public class compact_object_layout {

   public static float micro(MyClass obj) {
      return obj.accumFields();
   }

   public static void main(String [] args) {
     float res = 0.0f;
     for (int i = 1; i < 9000000; i++) {
         MyClass obj = new MyClass((float)i);
         res += micro(obj);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 1; i < 9000000; i++) {
         MyClass obj = new MyClass((float)i);
         res += micro(obj);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2 - t1) + " ms");
   }
}
