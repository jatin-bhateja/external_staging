
class test {
   public static final int LEN = 16;

   void getAddVec(int [] res , int [] a , int [] b) {
     for(int i = 0 ; i < LEN ; i++) {
       res[i] = a[i] + b[i];
       //if (res[i] != 10)
       //   throw new RuntimeException("Validation failed");         
      }
   }
   
   public static void main(String [] args) {
     test obj = new test();
     int [] a = new int[test.LEN];
     int [] b = new int[test.LEN];
     int [] res = new int[test.LEN];

     for (int i = 0 ; i < test.LEN ; i++) {
       a[i] = 10; 
       b[i] = 10; 
     }
     for (int k = 0 ; k < 10000000 ; k++)
       obj.getAddVec(res , a, b);
   }
}
