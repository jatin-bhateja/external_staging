public class Foo {
  public static short bar(float f) {return Float.floatToFloat16(f);}
  public static void main(String[] args) {
	 System.out.println(Float.floatToRawIntBits(Float.float16ToFloat((short) 31745)));
	 System.out.println(bar(Float.float16ToFloat((short) 31745)));
  }
}
