public class fmod1 {
  static float micro(float f1, float f2) {
     return f1 % f2;
  } 
  public static void main(String [] args) {
     float f1 = Float.parseFloat(args[0]);
     float f2 = Float.parseFloat(args[1]);
     System.out.println(f1 + " mod " + f2 + " = " + micro(f1, f2));
  }
}
