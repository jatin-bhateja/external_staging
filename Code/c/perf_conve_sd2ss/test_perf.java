public class test_perf {
  public static double compute_pi() {
    double pi = 4.0;
    boolean sign = false;

    for (int i = 3; i < 1000; i += 2) {
      if (sign) {
        pi += 4.0 / i;
      } else {
        pi -= 4.0 / i;
      }
      sign = !sign;
    }
    return pi;
  }
  public static void main(String [] args) {
    double res = 0.0;
    for (int i = 0; i < 1000000; i++) {
       res += compute_pi();
    }
    long t1 = System.currentTimeMillis();
    for (int i = 0; i < 1000000; i++) {
       res += compute_pi();
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + " ms [res] " + res);
  }
}
