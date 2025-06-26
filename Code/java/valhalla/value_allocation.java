

value class payload {
   double field1;
   double field2;
   payload(double field) {
       field1 = field + 10.0;
       field2 = field + 20.0;
   }
}

public class  value_allocation {
  public static void main() {
      payload obj = new payload(13.0);
      System.out.println(obj.field1 * obj.field2);
  }
} 
