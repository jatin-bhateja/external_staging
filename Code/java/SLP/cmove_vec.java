
public class cmove_vec {
    private static void micro(int[] a, int[] b, double[] c, double[] d, double[] r, double[] r2) {
        for (int i = 0; i < a.length; i++) {
            double cc = c[i];
            double dd = d[i];
            r2[i] = cc + dd;
            r[i] = (a[i] > b[i]) ? cc : dd;
        }
    }

    public static int [] a = new int[1024];
    public static int [] b = new int[1024];
    public static double [] c = new double[1024];
    public static double [] d = new double[1024];
    public static double [] r = new double[1024];
    public static double [] r2 = new double[1024];

    public static void main(String [] args) {
        for (int i = 0; i < 10000; i++) {
          micro(a, b, c, d, r, r2);
        }
    }
}
