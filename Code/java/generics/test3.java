
interface MyAbstractClass {
   public int getField1();
   public int getField2();
}

class MyClass implements MyAbstractClass {
   public int field1;
   public int field2;

   public MyClass(int f1, int f2) {
       this.field1 = f1;
       this.field2 = f2;
   }

   public int getField1() { return field1;}
   public int getField2() { return field2;}
}

public class test3 {
   public static
   <V super MyAbstractClass>
   int accumFields(V obj) {
      return obj.getField1() + obj.getField2();    
   } 
   public static void main(String [] args) {
       MyClass obj = new MyClass(10, 20);
       System.out.println(accumFields(obj));  
   }
} 
