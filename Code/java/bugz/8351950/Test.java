import jdk.incubator.vector.*;

public class Test {
    public static ShortVector sv1 = ShortVector.broadcast(ShortVector.SPECIES_256, (short)512);
    public static VectorMask<Short> sm = VectorMask.fromLong(ShortVector.SPECIES_256, -576460752303423480L);
    static final Object GOLD = test();

    public static Object test() {
        ShortVector sm2 = ShortVector.broadcast(ShortVector.SPECIES_256, (short)-32768);
        return sm2.lanewise(VectorOperators.MIN, sv1, sm).lanewise(VectorOperators.LSHR, 1);
        //return sm2.lanewise(VectorOperators.MAX, sv1, sm).lanewise(VectorOperators.LSHR, 1);
    }

    public static void main(String[] args) {
        System.out.println(GOLD);
        for (int i = 0; i < 10_000; i++) {
            test();
	}
        System.out.println(test());
    }
}
