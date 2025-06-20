
import java.util.Arrays;

class test {
   public static final int SIZE = 1024;

   public static int [] res;
   
   public static int [] ints; 

   public static long [] lres; 

   public static long [] longs; 
 
   public static void micro(int [] res, int [] ints, int inv1) {
      for (int i = 0; i < SIZE / 4; i++) {
         res[i + inv1] *= ints[i + inv1];
      }
   }

   public static int reductionAddSumOfArray() {
        int res = 0;
        long resl = 0;
        for (int i = 0; i < SIZE; i++) {
            //res += (ints[i] + ints[i]);
            res += ints[i]--;
            //longs[i] = (lres[i] * lres[i]) + (long)ints[i]; 
        }
        return res + (int)resl;
    }

   public static void main(String [] args) {
      res = new int[SIZE];
      ints = new int[SIZE]; 
      lres = new long[SIZE]; 
      longs = new long[SIZE]; 
      Arrays.fill(ints, 1);
      int r = 0;
      for(int i = 0; i < 10000; i++) {
          r += reductionAddSumOfArray();
      }
      /*
      for(int i = 0; i < 10000; i++) {
          micro(res, ints, 1);
      }*/
      System.out.println(r);
   }
}
