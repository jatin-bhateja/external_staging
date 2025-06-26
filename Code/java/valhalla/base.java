primitive class ABC {
  int f1;
  int f2;
  public ABC(int val) {
     f1 = val;
     f2 = val + 10; 
  }
}

value class XYZ {
  public ABC f1;
  public XYZ(int val)  {
     f1 = new ABC(val);
  }
  int aggregate() {
     return f1.f1 + f1.f2;
  }
}

public class base {
  public static int micro(int val) {
     XYZ [] arr = new XYZ[val];
     for(int i = 0; i < val; i++) {
        arr[i] = new XYZ(i);
     }
     int res = 0;
     for(int i = 0; i < val; i++) {
        res += arr[i].aggregate();
     }
     return res;
  }
  public static void main(String [] args) {
     int res = 0;
     for(int i = 0 ; i < 10000; i++) {
        res += micro(i);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 10000; i++) {
        res += micro(i);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + "ms  [Res] " + res);
  }
}
