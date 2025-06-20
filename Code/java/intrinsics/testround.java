
class testround {
   void workload(double [] res , double [] a) {
         double aval = a[6];
         res[0] = Math.ceil(9.007199254740992E15);
/*
         res[1] = Math.ceil(10.4);
         res[2] = Math.rint(10.4);
         res[3] = Math.floor(a[6]);
         res[4] = Math.ceil(a[6]);
         res[5] = Math.rint(a[6]);
         res[6] = Math.floor(aval);
         res[7] = Math.ceil(aval);
         res[8] = Math.rint(aval);
*/
   }
/*
   void vectorResArrFloor(double [] res , double [] a) {
      for(int i = 0 ; i < 1024; i++) {
         res[i] = Math.rint(a[i]);
      }
   }
*/
/*
   void getResArrCeil(double [] res , double [] a) {
      for (int i = 0 ; i < 8; i++)
         res[i] = Math.ceil(a[i]);
   }
   void getResArrRint(double [] res , double [] a) {
      for (int i = 0 ; i < 8; i++)
         res[i] = Math.rint(10.4);
   }
*/ 
   public static void main(String [] args) {
     testround obj = new testround();
     double [] a = new double[1024];
     double [] res = new double[1024];
     a[0] = Double.NaN;
     a[1] = Double.POSITIVE_INFINITY;
     a[2] = Double.NEGATIVE_INFINITY;
     a[3] = Double.MAX_VALUE;
     a[4] = Double.MIN_VALUE;
     a[5] = Double.MIN_NORMAL;
     a[6] = 10.4;
     a[7] = 5.5;
     for (int i = 8 ; i < 1024; i++)
        a[i] = i + 10;

     for (int k = 0 ; k < 1000000 ; k++) 
       obj.workload(res , a);

     for (int i = 0 ; i <= 8 ; i++)
       System.out.println("Res = " + res[i]);
/*
     for (int k = 0 ; k < 100000 ; k++) 
       obj.getResArrCeil(res , a);
     for (int i = 0 ; i <= 7 ; i++)
       System.out.println("Res = " + res[i]);

     for (int k = 0 ; k < 100000 ; k++) 
       obj.getResArrRint(res , a);
     for (int i = 0 ; i <= 7 ; i++)
       System.out.println("Res = " + res[i]);
*/
   }
}
