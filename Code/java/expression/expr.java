
import java.util.Arrays;

class expr {
  public static final int VALUE = 5;

  public static void micro(int idx, int [] r, int a) {
       r[idx] = a * 10;
  }

  public static void main(String [] args) {
     int [] a = new int[32];
     int [] r = new int[32];

     for (int i = 0 ; i < 32; i++)
        a[i] = 3;
     
     for (int i = 0 ; i < 100000 ; i++)
        micro(i & 31, r, a[i & 31]);
     
     System.out.println("[res] = " + Arrays.toString(Arrays.copyOfRange(r, 0, 4))); 
  }
}
