
import java.util.Random;
import java.util.Arrays;

class test {
  public static final int LEN = 0;

  public static int workload(int cnt) {
    byte [] src = new byte[0];
    byte [] dst = Arrays.copyOf(src, 0);
    return dst.length + cnt;
  }

  public static void main(String [] args) {
     int res = 0;
     for (int i = 0 ; i < 1900000 ; i++)
       res += workload(LEN);

     System.out.println("[Res] " + res);
  }
}

