
class testmax {
   public static final int LEN = 4;

   double getMaxArr(double a , double  b) {
     double max = 0.0;
     double min = 0.0;
     max = Math.max(a, b);
     return max + b;
   }
   
   public static void main(String [] args) {
     testmax obj = new testmax();
     double [] a = new double[4];
     double [] b = new double[4];
     double [] res = new double[4];

     for (int i = 0 ; i < 4 ; i++) {
       a[i] = 33.3; 
       b[i] = -10.0; 
       res[i] = 0.0;
     }
     for (int k = 0 ; k < 10000000 ; k++)
       res[1] = obj.getMaxArr(a[1], b[1]);
     System.out.println("a = " + a[1] + " b = " + b[1] + " : res -> " + res[1]);
   }
}
