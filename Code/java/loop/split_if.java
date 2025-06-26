
import java.util.stream.*;

public class split_if {
   public static void micro(int [] arr, int condition) {
      int  val = 10;
      if (condition > 10) {
         val -= 20;
      }
      // val = Phi entry:10, if_block: AddI val, 20
      if (val >  5) {
         arr[10] = 100;
      }  else {
         arr[10] = 200;  // Loop Invariant initialization. arr[10] can be hoisted out.
      }
   }

   public static void caller(int [] arr) {
      for (int i = 0; i < 100000; i++) {
          micro(arr, i);
      }
   }

   public static void main (String [] args) {
      int [] arr = IntStream.range(0, 20).toArray();
      for (int i = 0; i < 10000; i++) {
         caller(arr);
      }
      System.out.println("[res] " + arr[10]);
   }
}
