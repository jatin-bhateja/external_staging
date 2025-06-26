
abstract value class TopBox {
   public abstract long accumFields();
}

value class ValBox1 extends TopBox {
  public long field1;
  public long field2;
  public ValBox1(long field) {
     this.field1 = field + 10;
     this.field2 = field + 20;
  }
  public long accumFields() {
     return field1 + field2;
  }
}

value class ValBox2 extends TopBox {
  public long field1;
  public long field2;
  public ValBox2(long field) {
     this.field1 = field + 30;
     this.field2 = field + 40;
  }
  public long accumFields() {
     return field1 * field2;
  }
}

public class profiled_value_param {
  public static long leaf(TopBox obj) {
     return obj.accumFields();
  } 
  public static long micro(TopBox obj) {
     return leaf(obj); 
  }
  public static void main(String [] args) {
     long res = 0;
     for (int i = 0; i < 1000000; i++) {
         //if ((i & 1) == 0) {
             res += micro(new ValBox1(i));
         //} else {
         //    res += micro(new ValBox2(i));
         //}
     }
     System.out.println("[res] " + res);
  }
} 
