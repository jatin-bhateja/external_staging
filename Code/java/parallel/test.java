

class test implements  Runnable {

   public static synchronized int doOp(int a , int b) {
      return a * b;
   }

   public void run() {
     int res = 0 ;
     for(int i = 0 ; i < 10000000 ; i++)
        res += test.doOp(i , i+1);       
     System.out.println("Res = " + res); 
   }

   public static void main (String [] args) { 
      test obj = new test(); 
      Thread t1 = new Thread(obj);
      Thread t2 = new Thread(obj);
      t1.start(); 
      t2.start(); 
   }
}
