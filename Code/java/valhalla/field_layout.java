value class MyPrimitiveEmptyClass {
    public MyPrimitiveEmptyClass() {}
}


@jdk.internal.vm.annotation.ImplicitlyConstructible
@jdk.internal.vm.annotation.LooselyConsistentValue
value class MyPrimitiveClass {
   public long field1;
   public long field2;
   public MyPrimitiveClass(long val1, long val2) {
       this.field1 = val1;
       this.field2 = val2;
   }
   public String toString() {
       return "[MyPrimitiveClass] = { " + field1 + " , " +  field2 + " } ";
       //return "[MyPrimitiveClass] = { " + field1 + " } ";
   }
    
}

value class MyValueClass {
   @jdk.internal.vm.annotation.NullRestricted
   public MyPrimitiveClass field;
   MyValueClass(MyPrimitiveClass obj) {
       this.field = obj;
   }
   public String toString() {
       return "[MyValueClass] = { " + field + " } ";
   }
}


public class field_layout {
   public static void main(String [] args) {
      MyValueClass obj = new MyValueClass(new MyPrimitiveClass(10L, 20L));
      System.out.println(obj);
   }
}
