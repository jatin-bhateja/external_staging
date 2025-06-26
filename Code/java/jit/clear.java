class jit {
  public int micro(int a) {
     Object [] arr = new Object[1024];
     for(int i = 0; i < 1024; i++)
        arr[i] = new Object();
     return arr.length + a;
  }

  public static void main (String [] args) { 
    int Res = 0;
    jit obj = new jit();
    for ( int i = 0 ; i < 1000000 ; i++) {
      Res += obj.micro(i);
    }
    System.out.println("Res =  " + Res);
  }
}
