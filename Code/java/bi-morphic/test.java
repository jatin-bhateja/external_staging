abstract class Root {
  abstract int getVal(int val);
}

class Leaf1 extends Root {
  @Override 
  int getVal(int val) {
     return val * 10 + val * 20 + val * 30;
  }
}

class Leaf2 extends Root {
  @Override 
  int getVal(int val) {
     return val * 100 + val * 200 + val * 300;
  }
}

class Leaf3 extends Root {
  @Override 
  int getVal(int val) {
     return val * 1000 + val * 2000 + val * 3000;
  }
}

class test {
  int micro(int i, Root obj) {
     return obj.getVal(i) * 100;
  }

  public static void main(String [] args) {
     int res = 0;
     Leaf1 obj1 = new Leaf1();
     Leaf2 obj2 = new Leaf2();
     Leaf3 obj3 = new Leaf3();

     test obj  = new test();
     Root [] fn_tray = new Root[4]; 
     fn_tray[0] = obj1;
     fn_tray[1] = obj2;
     fn_tray[2] = obj3;
     fn_tray[3] = obj1;

     for(int i = 0 ; i < 100000; i++) {
        res += obj.micro(i, fn_tray[i & 1]);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 100000; i++) {
        res += obj.micro(i, fn_tray[i & 1]);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time]  "  + (t2-t1) + "ms [Res] " + res);
  }
}
