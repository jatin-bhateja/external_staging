
interface func {
  int apply(Integer a, Integer b , Integer c);
}

class test3 {
   public static int micro1(Integer a, Integer b , Integer c, func oper) {
     return oper.apply(a, b, c);
   }

   public static int micro2(Integer a, Integer b , Integer c, func oper) {
     return oper.apply(a, b, c);
   }

   public static void main(String [] args) {
     int Res = 0;
   
     for(int i = 0 ; i  < 10; i++) {
       Res += micro1(Integer.valueOf(i), Integer.valueOf(1), Integer.valueOf(1), (a, b, c) -> a + b + c);
     }
     System.out.println("Res1 = " + Res);

     Res = 0;
     for(int i = 0 ; i  < 10; i++) {
       Res += micro2(Integer.valueOf(i), Integer.valueOf(1), ((Integer)null), (a, b, c) -> a + b);
     }
     System.out.println("Res2 = " + Res);
   }
}
