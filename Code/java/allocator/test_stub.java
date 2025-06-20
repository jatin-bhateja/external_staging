

class test {
   static double doSum(double a , double b, int d, int e, int f, int g, int h, int j, int cond) {
       int res = 0;
       for (int i = 0 ; i < 1000 ; i++) {
         double temp = a;
         a = b;
         if (cond == 0)
           b =  temp;
         else
           b = 10;
         res += Math.tan(a) + Math.tan(b) + e + f + g + h + j;
       }
       return res + 100;
   }
   public static void main(String [] args) {
      double Res  = 0;
      for (int i = 0; i < 1000 ; i++)
        for (int j = 0; j< 1000 ; j++)
          Res += doSum((double)(i), (double)(j), i+j, i+1, i+2, i+3, i+4, i+5, (i+j) & 0x1);
      System.out.println("Res = " + Res);
   }
}
