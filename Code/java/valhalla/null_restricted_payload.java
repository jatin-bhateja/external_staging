import jdk.internal.vm.annotation.*;

@ImplicitlyConstructible
@LooselyConsistentValue
value class payload {
   double field1;
   double field2;
   public payload(double val) {
      field1 = val + 10.0;
      field2 = val + 10.0;
   }
   public double accumulate() {
      return field1 + field2;
   }
}

value class container {
   @NullRestricted
   payload pfield1;
   public container(payload obj) {
      pfield1 = obj;
   }
   public double accumulate() {
      return pfield1.accumulate();
   }
}
   
public class null_restricted_payload {
   public payload obj = null;

   public static double micro(payload obj) {
       container cobj = new container(obj);
       return cobj.accumulate();
   }
   public static void main(String [] args) {
       double res = 0.0;
       for (int i = 0; i < 100000; i++) {
           res += micro(new payload((double)i));
       }
       System.out.println(res);
   }
}
