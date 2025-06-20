class Test {
  private static void error(int i, String msg) {
    if (i > 90000000)
      throw new RuntimeException(msg);
  }

  public static void test(int i, String[] args) {
    error(i, "args[0] == " + args[0]);
    error(i+1, "args[0] == " + args[0]);
    error(i+2, "args[0] == " + args[0]);
    error(i+3, "args[0] == " + args[0]);
  }

  public static void main(String[] args) {
    for (int i = 1; i < 100000000; ++i) {
      test(i, args);
    }
  }
}
