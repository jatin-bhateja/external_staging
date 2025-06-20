

value class MyValue {
   public double fld1;
   public double fld2;
   public MyValue(double fld1, double fld2) {
       this.fld1 = fld1;
       this.fld2 = fld2;
   }
}

public class value_bug {
   public static MyValue micro(double val1, double val2, boolean true_path) {
       MyValue obj = null;
       if (true_path) {
          obj = new MyValue(val1, val2);
       }
       return obj;
   }
   public static void main(String [] args) {
      double res = 0.0;
      for (int i = 0; i < 10000; i++) {
          MyValue obj = micro((double)i , (double)(i+1), (i & 1) == 1);
          if (obj != null) {
             res += obj.fld1 + obj.fld2;
          }
      }
      System.out.println("[res] " +  res);
   }   
}
