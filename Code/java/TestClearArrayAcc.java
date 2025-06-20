
class Payload {
   public long f1;
   public long f2;
   public long f3;
   public long f4;
}

class TestClearArrayAcc {
  public static void  init_mem_leaf(Payload obj, long val) {
    obj.f1 = val;
  }
  public static void  init_mem_leaf(Object [] obj, int val) {
     for(int i = 0; i < obj.length ; i++) {
       obj[i] = Integer.valueOf(i + val);
     }
  }

  public static long  init_mem(int val) {
    Payload obj = new Payload();
    //Object []  obj = new Object[val];
    init_mem_leaf(obj, 10);
    return obj.getClass().getDeclaredFields().length;
  }

  public static void main(String [] args) {
    long Res = 0;
    for(int i = 0 ; i < 1000000 ; i++) {
      Res += init_mem(i%8); 
    }
    System.out.println("Res = " + Res);
  }
}
