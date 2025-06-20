
class testmax {
   public static final int LEN = 256;

   void getMaxArr(short [] res , short [] a , short [] b) {
      for(int i = 0 ; i < LEN ; i++)
        res[i] = (short)Math.max(a[i], b[i]);
   }
   
   public static void main(String [] args) {
     testmax obj = new testmax();
     short Res = 0; 
     short [] a = new short[256];
     short [] b = new short[256];
     short [] res = new short[256];

     for (int i = 0 ; i < LEN ; i++) {
       a[i] = 10; 
       b[i] = 10; 
     }
     for (int k = 0 ; k < 10000000 ; k++)
       obj.getMaxArr(res , a, b);

     System.out.println("Res = " + res[1]);
   }
}
