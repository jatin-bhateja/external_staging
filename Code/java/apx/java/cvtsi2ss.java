
public class cvtsi2ss {
   public static float micro(int d1, int d2, int d3, int d4, int d5, int d6, int val) {
       return (float)val;
   }
   public static void main(String [] args) {
       float res = 0.0f;
       for (int i = 0; i < 100000; i++) {
            res += micro(1,2,3,4,5,6,i);
       }
       System.out.println("[res] " + res);
   }
}
