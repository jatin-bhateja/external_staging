
import java.util.Arrays;

public class test {
  public static int micro(int size, int ctr) {
     Object [] objs = new Object[524288];
     Arrays.fill(objs, Integer.valueOf(1));
     return ((Integer)(objs[ctr])).intValue();
  }

  public static void main(String [] args) {
     int res = 0;
     int size = Integer.parseInt(args[0]);
     for (int i = 0; i < 1000000; i++) {
        res += micro(size, i % size);
     }
     System.out.println("[res] " + res);
  }
}
