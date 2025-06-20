
class testmax {
   public static final int LEN = 4;

   void getMaxArr(double [] res , double [] a , double [] b) {
     res[1] = Math.max(a[1], b[1]);
   }
   
   public static void main(String [] args) {
     testmax obj = new testmax();
     double [] a = new double[4];
     double [] b = new double[4];
     double [] res = new double[4];

     for (int i = 0 ; i < 4 ; i++) {
       a[i] = 10.0; 
       b[i] = 10.0; 
     }
     for (int k = 0 ; k < 10000000 ; k++)
       obj.getMaxArr(res , a, b);
   }
}
