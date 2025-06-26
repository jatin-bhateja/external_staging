
class compare {
  public static int micro(String a , String b) {
     int r1 = a.compareTo(b+1);
     int r2 = a.compareTo(b+2);
     int r3 = a.compareTo(b+3);
     int r4 = a.compareTo(b+4);
     int r5 = a.compareTo(b+5);
     return r1 + r2 + r3 + r4 + r5;
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    String val1 = "AVX";
    String val2 = "AVX";

    // warmup
    for(int i = 0; i < 10000000; i++)
       Res += micro(val1+i , val2+i+1);
    
    long t1 = System.nanoTime();
    for(int i = 0; i < 100000; i++)
       Res += micro(val1+i , val2+i+1);
    long t2 = System.nanoTime();

    System.out.println("[Time] : " + (t2-t1) + " Res =  " + Res);
  }
}
