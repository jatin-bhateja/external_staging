
import java.lang.invoke.MethodHandles;

public class mh_constant {
   public static int micro(int size) {
       int res = 0;
       try {
          for (int i = 0;  i < size; i++) {
              var mh =  MethodHandles.constant(int.class, i); 
              res += ((Integer)mh.invoke()).intValue();
          }
       } catch (Throwable e) {
          System.out.println(e);
       }
       return res;
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i);
      }
      System.out.println("[res] " + res);
   }
}
