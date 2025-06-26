//package org.apache.spark;

public class DivisionDemo {
    private static long DEFAULT_X_RANGE = 1L << 11;
    private static long DEFAULT_Y_RANGE = 1L << 11;

    public static void main(String[] args) {
        int iterations = Integer.parseInt(args[0]);
        String testCase = args[1];
        System.out.println("JVM version: " + System.getProperty("java.version"));
        for (int i = 0; i < iterations; i++) {
            benchmark(i, testCase);
        }
    }

    private static void benchmark(int iteration, String testCase) {
        DivisionDemo demo = new DivisionDemo();
        demo.init(testCase);
        long time1 = System.currentTimeMillis();
        for (long i = 0; i < DEFAULT_X_RANGE; i++) {
            for (long j = DEFAULT_Y_RANGE; j > 0; j--) {
                demo.test(i, j);
            }
        }

        long time2 = System.currentTimeMillis();
        for (long i = 0; i < DEFAULT_X_RANGE; i++) {
            for (long j = DEFAULT_Y_RANGE; j > 0; j--) {
                demo.noModTest(i, j);
            }
        }
        long time3 = System.currentTimeMillis();
        for (long i = 0; i < DEFAULT_X_RANGE; i++) {
            for (long j = DEFAULT_Y_RANGE; j > 0; j--) {
                demo.noPowerTest(i, j);
            }
        }
        long time4 = System.currentTimeMillis();

        demo.foo();
        System.out.println("Iteration " + iteration + 
            " regression case Took : " + (time2 - time1) + 
            " noMod case took: " + (time3 - time2) + 
            " noPower case took: " + (time4 - time3));
    }

    private TestCase testCase;

    private void init(String testCaseStr) {
        switch (testCaseStr) {
            case "l":
                testCase = new LongMod();
                break;
            case "f":
                testCase = new FloatMod();
                break;
            case "d":
                testCase = new DoubleMod();
                break;
        }
    }


    private void test(long x, long y) {
        testCase.test(x, y);
    }

    private void noModTest(long x, long y) {
        testCase.noModTest(x, y);
    }

    private void noPowerTest(long x, long y) {
        testCase.noPowerTest(x, y);
    }

    private String foo() {
        return testCase.foo();
    }

    abstract class TestCase {
        boolean regressionValue = false;
        boolean noModValue = false;
        boolean noPowerValue = false;

        abstract void test(long x, long y);

        abstract void noModTest(long x, long y);

        abstract void noPowerTest(long x, long y);

        public String foo() {
            String msg = "foo value is " + regressionValue + " and " + noModValue;
            return msg;
        }
    }

    private class LongMod extends TestCase {
        @Override
        public void test(long x, long y) {
            boolean result = (13L * x * x * x) % y == 1;
            regressionValue = regressionValue & result;
        }

        @Override
        void noModTest(long x, long y) {
            boolean result = (13L * x * x * x) / y == 1;
            noModValue = noModValue & result;
        }

        @Override
        void noPowerTest(long x, long y) {
            boolean result = (13L * x) % y == 1;
            noPowerValue = noPowerValue & result;
        }
    }

    private class FloatMod extends TestCase {
        @Override
        void test(long x_input, long y_input) {
            float x = (float) x_input;
            float y = (float) y_input;
            boolean result = (13.0F * x * x * x) % y == 1.0F;
            regressionValue = regressionValue & result;
        }

        @Override
        void noModTest(long x_input, long y_input) {
            float x = (float) x_input;
            float y = (float) y_input;
            boolean result = (13.0F * x * x * x) / y == 1.0F;
            noModValue = noModValue & result;
        }

        @Override
        void noPowerTest(long x_input, long y_input) {
            float x = (float) x_input;
            float y = (float) y_input;
            boolean result = (13.0F * x) % y == 1.0F;
            noPowerValue = noPowerValue & result;
        }
    }

    private class DoubleMod extends TestCase {
        @Override
        void test(long x_input, long y_input) {
            double x = (double) x_input;
            double y = (double) y_input;
            boolean result = (13.0D * x * x * x) % y == 1.0D;
            regressionValue = regressionValue & result;
        }

        @Override
        void noModTest(long x_input, long y_input) {
            double x = (double) x_input;
            double y = (double) y_input;
            boolean result = (13.0D * x * x * x) / y == 1.0D;
            noModValue = noModValue & result;
        }

        @Override
        void noPowerTest(long x_input, long y_input) {
            double x = (double) x_input;
            double y = (double) y_input;
            boolean result = (13.0D * x) % y == 1.0D;
            noPowerValue = noPowerValue & result;
        }
    }

}
