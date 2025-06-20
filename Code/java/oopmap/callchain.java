class Packet {
  public int field1;
  public int field2;
  public int field3;
  public int field4;
  public Packet(int val) {
     field1 = val;
     field2 = val + 10;
     field1 = val + 20;
     field1 = val + 30;
  }
  int accum() { 
     return field1 + field2 + field3 + field4;
  }
}

public class callchain {
   public static int leaf(int size) {
       int res = 0;
       for (int i = 0; i < 100; i++) {
          Packet obj = new Packet(i);
          if (size > 9997) {
             throw new AssertionError("Error");
          }
          res += obj.accum();
       }
       return res;
   }

   public static int midleaf(int size) {
       Packet obj = new Packet(size);
       int res = leaf(size + 1);
       return res + obj.accum();
   }

   public static int highleaf(int size) {
       Packet obj1 = new Packet(size);
       Packet obj2 = new Packet(size + 1);
       Packet obj3 = new Packet(size + 2);
       int res = midleaf(size + 1);
       return res + obj1.field1 + obj1.accum() + obj2.accum() + obj3.accum();
   }
 
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 10000; i++) {
           res += highleaf(i); 
       }
       System.out.println("[res] " + res);
   }
}
