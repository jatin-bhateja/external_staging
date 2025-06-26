

public class test {
    public static long micro(long a, long b, long c, long d, long e, long f, long g, long h, long i, long j , long k, long l, long m, long n, long o, long p) {
      return  a * b * c * 100L * d * e * f * 100L * g * h * i * j * k * l * m * n * o * p;
    }

    public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000; i++) {
         res += micro(i, i + 100, i + 200, i + 300, i + 400, i + 500, i + 600, i + 700, i + 800, i + 900, i + 1000, i + 1100, i + 1200, i + 1300, i + 1400,i + 1500);
      }
      System.out.println("[res] "  + res);
    }
}
