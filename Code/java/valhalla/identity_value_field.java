

primitive class Payload {
  public double field1;
  public double field2;
  public Payload(double field1, double field2) {
      this.field1 = field1;
      this.field2 = field2;
  }
}


public class identity_value_field {
   public int ifield1;
   public double ifield2;
   public Payload ifield3;
   public identity_value_field(int ival, double dval) {
       ifield1 = ival; 
       ifield2 = dval;
       ifield3 = new Payload(dval + 10.0, dval + 20.0);
   }
   public static double micro() {
       double res = 0.0;
       for (int i = 0; i < 100000; i++) {
           identity_value_field obj = new identity_value_field(i, (double)i*10);
           res += obj.ifield3.field1 + obj.ifield3.field2;
       }
       return res;
   }
   public static void main(String [] args) {
       double res = 0.0;
       for (int i = 0; i < 10000; i++) {
           res += micro(); 
       }
       System.out.println("[res] " + res);
   }
}
