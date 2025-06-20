

primitive class payload {
   double field1;
   double field2;
   double field3;
   double field4;
   double field5;
   double field6;
   double field7;
   double field8;
   public payload(double val1, double val2) {
       this.field1 = val1 + 10.0;
       this.field2 = val2 + 20.0;
       this.field3 = val1 + 30.0;
       this.field4 = val2 + 40.0;
       this.field5 = val2 + 50.0;
       this.field6 = val2 + 60.0;
       this.field7 = val2 + 70.0;
       this.field8 = val2 + 80.0;
   }
}


public value class vector {
   payload obj;
   public vector(payload obj) {
       this.obj = obj;
   } 
   public double accumPayload() {
      return obj.field1 + obj.field2 + obj.field3 + obj.field4 + obj.field5 + obj.field6 + obj.field7 + obj.field8;
   }
   public static double micro(double val) {
      vector obj = new vector(new payload(val, val));
      return obj.accumPayload();
   } 
   public static void main(String [] args) {
      double res = 0.0;
      for (int i = 0; i < 100000; i++) {
          res += micro((double)i);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
          res += micro((double)i);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
   }
}

