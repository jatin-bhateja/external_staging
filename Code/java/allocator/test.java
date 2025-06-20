

class test {
   static int leaf(int a, int b, int d, int cond) {
       int c = 0;
       if (cond  == 1 )
          c = a + b;
       else
          c = a - b;
       return c + d;
   }
   static int doSum(int a , int b, int d, int e, int f, int g, int h, int j, int cond) {
       int res = 0;
       for (int i = 0 ; i < 1000 ; i++) {
         int temp = a;
         a = b;
         if (cond == 0)
           b =  temp;
         else
           b = 10;
         res += leaf(a, b, d , cond) + e + f + g + h + j;
       }
       return res + 100;
   }
   public static void main(String [] args) {
      int Res  = 0;
      for (int i = 0; i < 1000 ; i++)
        for (int j = 0; j< 1000 ; j++)
          Res += doSum(i, j, i+j, i+1, i+2, i+3, i+4, i+5, (i+j) & 0x1);
      System.out.println("Res = " + Res);
   }
}
