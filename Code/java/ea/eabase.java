
class Dummy {
  public int field1;
  public int field2;
  public Dummy(int f1, int f2) {
     this.field1 = f1;
     this.field2 = f2;
  }
}

public class eabase {
   public static int micro(int v1, int v2) {
       Dummy obj = new Dummy(v1, v2);         // Allocation (NoEscape)  (Store(v1) | Store(v2)  -> Init) | SafePointScalar capture (v1, v2) | scalar_replacible if fields
                                              // Initializations are visible and iff visible then already forwarded during Load Idealizations.
       obj.field1 = 40 * obj.field1;          // Value Forwarding
       return obj.field1 + obj.field2;        // Value Forwarding (v1) , (v2)
   }
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 10000; i++) {
           res += micro(i, i + 10);
       }
       System.out.println(res);
   }
}
