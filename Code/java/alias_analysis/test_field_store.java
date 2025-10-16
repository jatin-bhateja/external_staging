

public class test_field_store {
   public double d1;
   public double d2;
   public double d3;
   public double d4;

   public test_field_store(double d1, double d2, double d3, double d4) {
       this.d1 = d1;
       this.d2 = d2;
       this.d3 = d3;
       this.d4 = d4;
   }
   
   public static double micro(double d1, double d2, double d3, double d4) {
       test_field_store obj = new test_field_store(d1, d2, d3, d4);
       return obj.d1 + obj.d2 + obj.d3 + obj.d4; 
   }

   public static void main(String [] args) {
       double res = 0.0;
       for (int i = 0; i < 100000; i++) {
           res += micro((double)i, (double)i*2, (double)i*4, (double)i*8);
       } 
       System.out.println("[res] " + res);
   }
}
