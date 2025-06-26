
class jit {

  public static int micro(int [] mem, int index) {
     mem[index] = 10;
     return mem[index];
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    int [] mem = new int[1024];
    for ( int i = 0 ; i < 1000000 ; i++)  {
      Res += micro(mem, i & (mem.length - 1));
    }
    System.out.println("Res =  " + Res);
  }
}
