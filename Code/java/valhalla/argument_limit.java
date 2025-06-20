
value class FlatPayload {
   double field1;
   double field2;
   double field3;
   double field4;
   double field5;
   double field6;
   double field7;
   double field8;
   double field9;
   double field10;
   double field11;
   double field12;
   double field13;
   double field14;
   double field15;
   double field16;
   double field17;
   double field18;
   double field19;
   double field20;
   public FlatPayload (double val) {
      field1 = val;
      field2 = val + 20.0;
      field3 = val + 30.0;
      field4 = val + 40.0;
      field5 = val + 50.0;
      field6 = val + 60.0;
      field7 = val + 70.0;
      field8 = val + 80.0;
      field9 = val + 90.0;
      field10 = val + 100.0;
      field11 = val + 110.0;
      field12 = val + 120.0;
      field13 = val + 130.0;
      field14 = val + 140.0;
      field15 = val + 150.0;
      field16 = val + 160.0;
      field17 = val + 170.0;
      field18 = val + 180.0;
      field19 = val + 190.0;
      field20 = val + 100.0;
   }
   double accumulate() {
      return field1 + 2*field2 + 3*field3 + 4*field4 + 5*field5 + 6*field6 + 7*field7 + 8*field8 + 9*field9 + 10*field10 +
             11*field11 + 12*field12 + 13*field13 + 14*field14 + 15*field15 + 16*field16 + 17*field17 + 18*field18 + 19*field19 +
             20*field20;
   }
}


public class argument_limit {
      public static double micro (FlatPayload param1, FlatPayload param2, FlatPayload param3, FlatPayload param4, FlatPayload param5,
                                  FlatPayload param6, FlatPayload param7, FlatPayload param8, FlatPayload param9, FlatPayload param10) {
           return param1.accumulate() + param2.accumulate() + param3.accumulate() + param4.accumulate() + param5.accumulate() +
                  param6.accumulate() + param7.accumulate() + param8.accumulate() + param9.accumulate() + param10.accumulate(); 
      }
      public static void main (String [] args) {
           double res = 0.0;
           for (int i = 0; i < 10000; i++) {
               
               res += micro(new FlatPayload((double)i),
                            new FlatPayload((double)i + 10),
                            new FlatPayload((double)i + 20),
                            new FlatPayload((double)i + 30),
                            new FlatPayload((double)i + 40),
                            new FlatPayload((double)i + 50),
                            new FlatPayload((double)i + 60),
                            new FlatPayload((double)i + 70),
                            new FlatPayload((double)i + 80),
                            new FlatPayload((double)i + 90));
           }
           long t1 = System.currentTimeMillis();
           for (int i = 0; i < 10000; i++) {
               
               res += micro(new FlatPayload((double)i),
                            new FlatPayload((double)i + 10),
                            new FlatPayload((double)i + 20),
                            new FlatPayload((double)i + 30),
                            new FlatPayload((double)i + 40),
                            new FlatPayload((double)i + 50),
                            new FlatPayload((double)i + 60),
                            new FlatPayload((double)i + 70),
                            new FlatPayload((double)i + 80),
                            new FlatPayload((double)i + 90));
           }
           long t2 = System.currentTimeMillis();
           System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
      }
}
