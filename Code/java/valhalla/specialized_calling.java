
abstract class Parent {
   public abstract int genHash();
}

value class Child1 extends Parent {
   int field1;
   int field2;
   public Child1 (int f1, int f2) {
      this.field1 = f1;
      this.field2 = f2;
   }
   public int genHash() { return field1 >> field2; }
}

value class Child2 extends Parent {
   int field1;
   int field2;
   int field3;
   int field4;
   public Child2 (int f1, int f2, int f3, int f4) {
      this.field1 = f1;
      this.field2 = f2;
      this.field3 = f3;
      this.field4 = f4;
   }
   public int genHash() { return (field1 + field2 >> field3) * field4; }
}

public class specialized_calling {
   public int micro(Parent obj) {
       return obj.genHash();
   }
   public static void main(String [] args) {
       int nesting_topology = Integer.parseInt(args[0]);
       specialized_calling obj = new specialized_calling();
       int res = 0;
       if (nesting_topology == 0) {
           for (int i = 0; i < 100000; i++) {
               if ((i & 1) == 0) {
                   res += obj.micro(new Child1(i, i + 10));
               } else {
                   res += obj.micro(new Child2(i, i + 10, i + 20, i + 30));
               }
           }
       } else if (nesting_topology == 1) {
           for (int i = 0; i < 100000; i++) {
               res += obj.micro(new Child1(i, i + 10));
           }
       } else  {
           for (int i = 0; i < 100000; i++) {
               res += obj.micro(new Child2(i, i + 10, i + 20, i + 30));
           }
       }
       System.out.println("[res] " + res);
   }
} 
