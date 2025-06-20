import java.nio.ByteBuffer;

public class Add {
   public static ByteBuffer buf = ByteBuffer.allocateDirect(4);
   public static short micro(float f) {
      return Float.floatToFloat16(f);
   }
   public static void main(String [] args) {
      buf.putInt(Integer.parseInt(args[0]));
      buf.rewind();
      float f = buf.getFloat(0);
      System.out.println(micro(f));
      System.out.println(micro(Float.NaN));
   }
}
