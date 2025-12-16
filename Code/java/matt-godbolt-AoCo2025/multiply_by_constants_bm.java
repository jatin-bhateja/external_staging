public class multiply_by_constants_bm {
  //2, 3, 4, 16, 25 and 522.
  public static long mul_by_2(long a) {
     return a * 2;
  }
  public static long mul_by_3(long a) {
     return a * 3;
  }
  public static long mul_by_5(long a) {
     return a * 5;
  }
  public static long mul_by_9(long a) {
     return a * 9;
  }
  public static long mul_by_4(long a) {
     return a * 4;
  }
  public static long mul_by_18(long a) {
     return a * 18;
  }
  public static long mul_by_81(long a) {
     return a * 81;
  }
  public static long mul_by_15(long a) {
     return a * 15;
  }
  public static long mul_by_27(long a) {
     return a * 27;
  }
  public static long mul_by_10(long a) {
     return a * 10;
  }
  public static long mul_by_45(long a) {
     return a * 45;
  }
  public static long mul_by_6(long a) {
     return a * 6;
  }
  // Optimized:
  // T1 = LEA A, A, 4   => A  + 4A  => 5A
  // T2 = LEA 5A, 5A, 4 => 5A + 20A => 25A
  // Scheme is simple
  //  Base Index Scale  Output
  //   A    A      1     2A
  //   A    A      2     3A
  //   A    A      4     5A
  //   A    A      8     9A
  //  Q. Which constant multiplications can be optimized using above ?
  //  A. Base/Index  Scale  Constant multipler[iterations]
  //         A         1             2
  //         A         2             3[1], 9[2], 27[3], 81[4] => 3^x | constrain iteration count by latency of imul i.e. 3 cycles.
  //         A         4             5[1], 25[2], 125[3]      => 5^x | constrain iteration count by latency of imul
  //         A         8             9[1], 81[2],             => 9^x | constrain iteration count by latency of imul
  //    Uptill now we have only consider same scalar across of all
  //    the iterations of LEA, considering different scale can handle
  //    many more constants, infact design an efficient algorithm to
  //    split the constant multiplication across differnt LEA instruction
  //    with same or varied scale using dynamic programming technique.
  //    e.g. 45 => LEA1 A, A, 8, LEA2 9A, 9A, 4
  //    Base Index    Scale1   Scale2   Multipiler
  //     A     A       1        2      2A + 2*2A = 6A
  //                   1        4      2A + 4*2A = 10A
  //                   1        8      2A + 8*2A = 17A
  //                   2        2      3A + 2*3A = 9A
  //                   2        4      3A + 4*3A = 15A
  //                   2        8      3A + 8*3A = 27A
  //                   4        8      5A + 8*5A = 45A
  //     A     A       2        -                  3A
  //                   4        -                  5A
  //                   8        -                  9A
  //     2A    A       -> shift 1 + add (3A)
  //     4A    A       -> shift 2 + add (5A)
  //     8A    A       -> shift 3 + add (9A)
  //     A    4A  2    -> shift 3 + add (9A)
  //     A    8A  2    -> shift 4 + add (17A)
  //     2A   2A  2    -> shift 2 + add + add  | lea a a + lea 2a , 2a, 2 -> 6A
  //  Based on experiment constants handled by single LEA are clear winners
  //  against imul, with 2-leas we see degradation in performance.
  public static long mul_by_25(long a) {
     return a * 25;
  }
  // Optimized:
  // T1 =
  public static long mul_by_522(long a) {
     return a * 552;
  }
/*
3 => [1, 2, 1]
4 => [2, 2, 1]
5 => [1, 2, 2]
6 => [3, 3, 1]
7 => [1, 3, 2]
9 => [3, 3, 2]
10 => [5, 5, 1]
11 => [1, 5, 2]
13 => [1, 3, 4]
15 => [5, 5, 2]
17 => [1, 2, 8]
18 => [9, 9, 1]
19 => [1, 9, 2]
21 => [1, 5, 4]
25 => [5, 5, 4]
27 => [9, 9, 2]
37 => [1, 9, 4]
41 => [1, 5, 8]
45 => [9, 9, 4]
73 => [1, 9, 8]
81 => [9, 9, 8]
*/

  public static void runBm(String msg, long a) {
     long res = a;
     for (int i = 0 ; i < 90000000; i++) {
         res += mul_by_6(i);
         res += mul_by_10(i);
         res += mul_by_15(i);
         res += mul_by_18(i);
         res += mul_by_25(i);
         res += mul_by_27(i);
         res += mul_by_45(i);
         res += mul_by_81(i);
     }
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 90000000; i++) {
         res += mul_by_6(i);
         res += mul_by_10(i);
         res += mul_by_15(i);
         res += mul_by_18(i);
         res += mul_by_25(i);
         res += mul_by_27(i);
         res += mul_by_45(i);
         res += mul_by_81(i);
     }
     long end = System.currentTimeMillis();
     IO.println("[" + msg + " time] " + (end - start) + "ms [res] " + res);
  }

  public static void main(String [] args) {
     int num = Integer.parseInt(args[0]);
     runBm("MulxConstants", num);
     IO.println("PASS");
  }
}
