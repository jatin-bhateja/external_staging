
value class value_class {
   int field;
   static int field_counter = 1;
   public value_class(int field) {
      this.field = field;
   }
   public int get_field() {
      return this.field;
   }
   public static synchronized int getCount() {
      return field_counter++;
   }
}

public class value_class_container {
   public static int micro(int i ) {
       value_class vfield = new value_class(i);
       return vfield.get_field() * 100;
   }
   
   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 10000; i++) {
         res += micro(i * 2);
      }
      System.out.println("[RES] " + res + " [ACK] " + value_class.getCount());
   }
}
