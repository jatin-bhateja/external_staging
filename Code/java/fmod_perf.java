

public class fmod_perf {
   public static float fmod(float f1, float f2) {
      return f1 % f2;     
   }

   public static void main(String [] args) {
      float res = 0.0f;
      float f2 = Float.POSITIVE_INFINITY;
      float f1 = Float.parseFloat(args[0]);
      for (int i = 0;  i < 10000000; i++) {
          res += fmod(f1, f2); 
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0;  i < 10000000; i++) {
          res += fmod((float)i * f1, f2); 
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time]  " + (t2-t1) + " ms  [res] " + res);
   }
}
