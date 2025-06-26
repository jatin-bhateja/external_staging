
class MinMax {
    public static void main(String... args) {
      double res = 0.0;
      for (int i = 0 ; i < 1000000; i++)
        res += test((double)i);
      System.out.println("Res = " + res);
    }
    public static double test(double arg) {
      return Math.max(arg, arg+1);
    }
}

