
value class vClass {
   public long field1;
   public long field2;

   public vClass(long val) {
      this.field1 =  val;
      this.field2 =  val;
   }
}

public class values {
   public long micro(int i) {
      vClass obj = new vClass(i);
      return obj.field1 + obj.field2;
   }
   public static void main(String [] args) {
      long res = 0;
      values o = new values();
      for (int i = 0; i < 20000; i++) {
          res += o.micro(i);
      }
      System.out.println(res);
   }
}
