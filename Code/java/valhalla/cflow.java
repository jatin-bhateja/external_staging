
import java.util.Arrays;

public class cflow {
   public static void micro(int [] cond, int [] a, int [] b) {
     Arrays.fill(a, 0);
     for (int i = 0; i < 2; i++) {
       if (cond[i] == 0) {
         a[i] = b[i];
       }
     }
   } 
   public static void main(String [] args) {
      int [] b = {1, 2}; 
      int [] a = new int[2];
      int [] cond = {1, 0};
      
      for (int i = 0; i < 1000; i++) {
         micro(cond, a, b);
      }
      System.out.println(a[0] + a[1]);  
   }
}
