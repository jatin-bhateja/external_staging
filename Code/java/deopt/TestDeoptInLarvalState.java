
// CommandLine: -Xbatch -XX:CompileThresholdScaling=0.3 -XX:+PauseAtStartup -XX:CompileOnly=TestDeoptInLarvalState::micro -XX:CompileCommand=DontInline,TestDeoptInLarvalState::cleanup -XX:+PrintDeoptimizationDetails --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -cp . TestDeoptInLarvalState

import jdk.internal.misc.Unsafe;

value class Pair {
    public double d1, d2;
    public Pair(double d1, double d2) {
        this.d1 = d1;
        this.d2 = d2;
    }
}

public class TestDeoptInLarvalState {
    static final long OFFSET = 16;

    public static Pair cleanup(Pair p) {
        return Unsafe.getUnsafe().finishPrivateBuffer(p);
    }

    public static double micro(double value, int iter) {
        Pair p = Unsafe.getUnsafe().makePrivateBuffer(new Pair(10.0, 20.0));
        Unsafe.getUnsafe().putDouble(p, OFFSET, value);
        if (iter == 5000) {
           throw new AssertionError(p.d1);
        }
        p = Unsafe.getUnsafe().finishPrivateBuffer(p);
        return p.d1 + p.d2;
    }

    public static void main(String[] args) {
        double res = 0.0;
        for (int i = 0; i < 10000; i++) {
            res += micro((double)i, i);
        }
        System.out.printf("[res]" + res);
    }
}

