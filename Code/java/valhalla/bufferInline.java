abstract class Base {
  public abstract int getIndex();
}

primitive class Address {
  long f1;
  long f2;
  long f3;
  long f4;
  long f5;
  long f6;
  long f7;
  long f8;
  //int [] f3;
  Address(long i1, long i2) {
     this.f1 = i1;
     this.f2 = i1;
     this.f3 = i1;
     this.f4 = i1;
     this.f5 = i2;
     this.f6 = i2;
     this.f7 = i2;
     this.f8 = i2;
     //this.f3 = new int[i1 + 512];
  }
}

primitive class Packet extends Base {
  int f1;
  int f2;
  Address addr;
  Packet(int i1, int i2) {
     this.f1 = i1;
     this.f2 = i1;
     this.addr = new Address((long)i1, (long)i2);
  }
  public int getIndex() {
     return f1 << 16 | f2;
  }
}

public class bufferInline {
  public static int func(Base ref) {
     return ref.getIndex();
  }
  public static int micro(int i) {
     Packet obj = new Packet(i, i + 100);
     return func(obj);
  }
  public static void main(String [] args) {
    int res = 0;
    for(int i = 0; i < 10000; i++) {
       res += micro(i); 
    }
    System.out.println("[Res] " + res);
  }
}
