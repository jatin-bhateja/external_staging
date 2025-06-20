
import jdk.internal.vm.annotation.Stable;

public class test {
   @Stable
   public static float [] arr1 = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f};    

   @Stable
   public static float [] arr2; 

   public static final float [] arr3 = {1.0f, 2.0f, 3.0f, 4.0f};

   public test(int size) {
      arr2 = new float[size];
      for (int i = 0; i < size; i++) {
         arr2[i] = (float)i + 1;
      }
   }

   public float micro1() {
      return arr1[7];
   }
   public float micro2() {
      return arr2[10];
   }
   public float micro3() {
      return arr3[2];
   }

   public static void main(String [] args) {
      float res = 0.0f; 
      // Stable Value Caching to staisfy compile time invariants.
      test obj = new test(Integer.parseInt(args[0]));
      for (int i = 0; i < 100000; i++) {
          res += obj.micro1() + obj.micro2() + obj.micro3();
      }
      System.out.println("[res] " + res);
   }
}
