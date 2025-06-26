

import java.util.Random;

class cmiss {
   public static int workload(int [] arr) {
      int Sum = 0;
      Random r = new Random();
      for (int i = 0 ; i < 1024 ; i++) {
         int index = r.nextInt(1023);
         Sum += arr[index];
      } 
      return Sum;
   }
   public static void main(String [] args) {
      int Res = 0;
      int [] arr=  new int[1024];
      for(int i = 0 ; i < 1024; i++)
         arr[i] = i;

      for(int i = 0 ; i < 100000; i++)
         Res += workload(arr);

      System.out.println("Res = " + Res);
   }

}
