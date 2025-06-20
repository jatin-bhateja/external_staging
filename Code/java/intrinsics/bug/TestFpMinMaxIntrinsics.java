
import java.util.Arrays;

public class TestFpMinMaxIntrinsics {
    private static final double dPos     =  482390926662501720.0;
    private static final double dNeg     = -333333333333333333.3;

    private static final double[][] d_cases = {
        //     a         b         min       max
        {     dPos,     dNeg,     dNeg,     dPos },
    };

    private static void dTest(double[] row) {
        double min = Math.min(row[0], row[1]);
        //double max = Math.max(row[0], row[1]);
        if (min != row[2]) {
            throw new AssertionError(("Unexpected result of double min/max: " +
                    "a = " + row[0] + ", b = " + row[1] + ", " +
                    "result = (" + min + ") , " +
                    "expected = (" + row[2] + ", " + row[3] + ")"));
/*
            throw new AssertionError(("Unexpected result of double min/max: " +
                    "a = " + row[0] + ", b = " + row[1] + ", " +
                    "result = (" + min + ", " + max + "), " +
                    "expected = (" + row[2] + ", " + row[3] + ")"));
*/
        }
    }

   public static void main(String[] args) {
     for (int i = 0 ; i < 100000 ; i++) {
        Arrays.stream(d_cases).forEach(TestFpMinMaxIntrinsics::dTest);
     }
     System.out.println("PASS");
   }
}

