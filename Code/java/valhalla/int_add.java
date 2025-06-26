
public class int_add {
  public static int micro(int a, int b) {
    Integer ia = new Integer(a);
    Integer ib = new Integer(b);
    return ia.intValue() + ib.intValue();
  }

  public static void main (String [] args) {
    int res = 0;
    for (int i = 0;i < 10000; i++) {
        res += micro(i , i + 1);
    }
    System.out.println("[res] " + res);
  }
}
