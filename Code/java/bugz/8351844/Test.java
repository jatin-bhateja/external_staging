import jdk.incubator.vector.*;

public class Test {
    static final Object GOLD = test();
    
    public static Object test() {
        LongVector lv1 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv2 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv3 = LongVector.broadcast(LongVector.SPECIES_256, 16385L);
        return lv1.lanewise(VectorOperators.MIN, lv2).add(lv3);
    }

    public static void main(String[] args) {
        System.out.println(GOLD);
        for (int i = 0; i < 10_000; i++) {
            test();
	}
        System.out.println(test());
    }
}
