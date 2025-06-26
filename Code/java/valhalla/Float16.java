//public value class Float16 {
public class Float16 {
   short _value;

   Float16(short value) {
      _value = value;
   }

   public Float16 [] afp16_field_r = new Float16[10];
   public short [] afp16_field_s = new short[10];
 
   public static void main(String [] args) {
      Float16 val = new Float16((short)10);
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
          val = new Float16((short)(10 + val._value));
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + val._value);
   }
}
