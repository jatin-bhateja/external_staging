
class jit {
  public static native int eval(int a);

  public int micro(int a) {
    return eval(a);
  }

  static {
    System.loadLibrary("micro_native");
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    jit obj = new jit(); 
    for ( int i = 0 ; i < 1000000 ; i++)  {
      Res += obj.micro(1);
    }
    System.out.println("Res = " + Res);
  }
}
