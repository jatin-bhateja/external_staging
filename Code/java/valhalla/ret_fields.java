primitive class Box {
  int f1;
  int f2;
  long f3;
  Box(int i1, int i2, long l1) {
     f1 = i1;
     f2 = i2;
     f3 = l1;
  }
}


public class ret_fields {
  public static Box micro(int i, long l) {
     Box obj = new Box(i, i + 10, l);
     return obj;
  } 
  public static void main(String [] args) {
     int res = 0;
     Box.ref obj = null;
     for(int i = 0; i < 10000; i++) {
        obj = micro(i, ((long)(i) + Integer.MAX_VALUE));
        res += obj.f1 * obj.f2 + obj.f3;
     }
     System.out.println("[Res] " + res);
  }
}
