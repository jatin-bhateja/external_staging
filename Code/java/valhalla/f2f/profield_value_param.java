
/*
   With -XX:TypeProfileLevel=222, parameter 'obj' of leaf method will be typecasted to a non-null value class based on speculative type
   An immediate read access of one of its field using unsafe get API will load value from a non-scalarized narrow oop instead of InlineTypeNode.

   Its not sub-optimal given that parameter arrived as a non-scalarized value. To get any performane benefit, a value object must be passed in
   scalarized form. Scalarization behavior of a method is fixed upfront during linking stage and is dependent on parameter signatures.
   An abstract value class parameter will also be received as an oop, a subsiquent scalarization in callee will need to load the field
   values from oop, but then its no better than loading the field value on demand durng getfield / putfield processing.
*/

abstract class TopBox {
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

public class profield_value_param {
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
