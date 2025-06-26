

class test {
   public static int doSum(int... var) {
     int Sum = 0;
     System.out.println("Class of = " +  var.getClass()); 
     for(int i = 0 ; i < var.length  ; i++) {
       Sum += var[i];    
     }
     return Sum;
   }
   public static void main (String [] args) {
      System.out.println("Res = " + doSum(10,20,30));
      System.out.println("Res = " + doSum(10,20,30,40));
   }
}
