
public class inductive_phi {
   public static double micro(boolean [] mask) {
       double res = 2.0;
       for (int i = 0; i < 2; i++) {
           if (mask[i]) {
               res += 10.0;
           }
       }
       return res;
   }
   public static void main(String [] args) {
      double res = 0.0;
      boolean [] mask = {true, false};
      for (int i = 0; i < 10000; i++) {
          res += micro(mask);
      }
      System.out.println(res);
   }
}
