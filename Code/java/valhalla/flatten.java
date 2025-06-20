
primitive class ABC {
   int f1;
   long f2;
   ABC (int f1, long f2) {
      this.f1 = f1;
      this.f2 = f2;
   }
}


public class flatten {
   public final ABC field;

   public flatten(int val) {
     this.field = new ABC(val, (long)val);
   }

   public static long micro(int val) {
      flatten obj =  new flatten(val);
      return obj.field.f1 + obj.field.f2;
   }

   public static void main(String [] args) {
      long res = 0;
      for (int i = 0; i < 10000; i++) {
          res += micro(i);
      }
      System.out.println(res);
   }
} 
