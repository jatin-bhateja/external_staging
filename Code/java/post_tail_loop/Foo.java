public class Foo {

  private static final int SIZE = 65536;

  private static void bar(int[] a, int[] b, int[] c, int start, int limit) {
    for (int i = start; i < limit; i += 1) {
      c[i] = a[i] + b[i];
    }
  }

  public static void main(String[] args) {
    int[] a = new int[SIZE];
    int[] b = new int[SIZE];
    int[] c = new int[SIZE];

    for (int i = 0; i < SIZE; i++) {
      a[i] = i;
      b[i] = i;
      c[i] = 0;
    }

    for (int i = 0; i < 20000; i++) {
      bar(a, b, c, 16384, 32768);
    }

    int sum = 0;
    for (int i = 32760; i < 32780; i++) {
      sum += c[i];
    }
    System.out.println(sum);
  }
}
