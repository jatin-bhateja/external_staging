
import java.util.Objects;

class compare {
  public static int micro(String a , String b) {
     return Objects.equals(a,b) ? 1 : 0;
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    String val1 = "AVX";
    String val2 = "AVX";

    // warmup
    for(int i = 0; i < 10000000; i++)
       Res += micro(val1 , val2);
    
    long t1 = System.nanoTime();
    for(int i = 0; i < 100000; i++)
       Res += micro(val1 , val2);
    long t2 = System.nanoTime();

    System.out.println("[Time] : " + (t2-t1) + " Res =  " + Res);
  }
}
