
primitive class VectorPayloadMF256 {
   public float [] mfield;
   public VectorPayloadMF256() {
       mfield = new float[8];
   }
   public VectorPayloadMF256(float [] obj) {
       mfield = obj;
   }
   public float getLane(int i) {
      return mfield[i];
   }
}

value class FloatVector256 {
  public final int LENGTH = 8;
  public VectorPayloadMF256 mfield;

  public float getLane(int i) {
     return mfield.getLane(i);
  }

  FloatVector256(float [] obj) {
     mfield = new VectorPayloadMF256(obj);
  }

  FloatVector256() {
     mfield = new VectorPayloadMF256();
  }

  FloatVector256 add(FloatVector256 obj) {
     float [] temp = new float[LENGTH];
     for(int i = 0; i < LENGTH; i++) {
        temp[i] = this.getLane(i) + obj.getLane(i);
     }
     return new FloatVector256(temp);
  }
  float reduce() {
     float res = 0.0f;
     for(int i = 0; i < LENGTH; i++) {
        res += this.getLane(i);
     }
     return res;
  }
}

public class test_vector {
   public static FloatVector256 doSum(FloatVector256 val1, FloatVector256 val2) {
       return val1.add(val2);
   }

   public static FloatVector256 micro(int count) {
      FloatVector256 val = new FloatVector256();
      for(int i = 0; i < count; i++) {
          val = val.add(val);
      } 
      return val;
   }
 
   public static void main(String [] args) {
      FloatVector256 res = null;
      for(int i = 0 ; i < 10000; i++) {
        res = micro(1000);
      }
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000; i++) {
        res = micro(1000);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  "ms   [Res] = " + res.reduce());
   }
}
