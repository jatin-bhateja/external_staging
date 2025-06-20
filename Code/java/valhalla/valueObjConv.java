abstract class Parent {
   abstract int getIndex();
   int printStr(Parent val) {
      return val.getIndex();
   }
}

primitive class Child extends Parent {
   public int f1;
   public int f2;
   public int f3;
   public int f4;
   Child(int i1, int i2) {
      this.f1 = i1;
      this.f2 = i2;
      this.f3 = i1 + 10;
      this.f4 = i2 + 10;
   }
   int getIndex() {
      return f1 << 16 | f2;
   }
   static int getIndexForChild(Parent val) {
      return val.getIndex();
   }
   static int getIndexForChild(Child.ref val) {
   //static int getIndexForChild(Child val) {
      return val.f1 << 16 | val.f2;
   }
}

public class valueObjConv {
   //public final Child.ref pobj;
   //public static final Child.ref pobj = new Child(10, 100);
   public static final Parent pobj = new Child(10, 100);

   static int micro(valueObjConv obj) {
      int res = 0;
      // Child obj = new Child(val, val + 10); 
      // primitve object to itentity reference conv.
      res = pobj.printStr(obj.pobj);
      // value obj conv               
      return res + Child.getIndexForChild(pobj) +
             pobj.getIndex();
   }
   valueObjConv() {
   }
   public static void main(String [] args) {
      int res = 0;
      valueObjConv obj = new valueObjConv();
      for(int i = 0; i < 10000; i++) {
         res +=  micro(obj);
      }
      System.out.println("[Res] " + res);
   }
}
