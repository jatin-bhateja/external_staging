
class jitb {
  public static final int LEN  = 1024;

  static void test_fun(byte[] a0, byte[] c0) {
    for (int i=0; i<LEN; i++) {
      c0[i] = (byte)(a0[i] << (7) | a0[i] >>> (-7));
    }   
  }

  // Driver
  public static void main(String [] args) {
    byte [] arr = new byte[LEN];
    byte [] res = new byte[LEN];
    jitb obj = new jitb();
    for( int i = 0; i < LEN ; i++) {
      arr[i]  = (byte)0x1;
    }

    for (int k = 0 ; k < 10000 ; k++) {
      test_fun(arr, res);
    }

    long t1 = System.nanoTime();
    for (int k = 0 ; k < 10000 ; k++) {
      test_fun(arr, res);
    }
    long t2 = System.nanoTime();
    
    System.out.println("[Time] " + (t2-t1) + " ms");
    for(int i = 0 ;i < 8 ;i++) {
       System.out.println("res[" + i + "] = "  + res[i]);
    }
  }
} 
