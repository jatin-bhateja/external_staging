
value class Packet {
  float field1; 
  float field2; 
  Packet(float f1, float f2) {
    this.field1 = f1;
    this.field2 = f2;
  }
}

public class icc {
   public static Packet micro(Packet obj) {
      return new Packet(obj.field1 + obj.field2, 10.0f);
   }
   public static float caller(int val) {
      Packet obj = new Packet((float)val, (float)val + 10.0f);
      obj = micro(obj);
      return obj.field1 + obj.field2;
   }
   public static void main (String [] args) {
      float res = 0.0f;
      for (int i = 0; i < 10000; i++) {
          res += caller(i); 
      }
      System.out.println("[res] " + res);
   }
}
