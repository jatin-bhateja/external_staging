
import jdk.incubator.vector.*;
import java.util.Arrays;

public class Add {
    public static int[] src = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
    public static IntVector vec = IntVector.broadcast(IntVector.SPECIES_256, 1);
    public static void micro(int [] src, int [] dst) {
        var vec = IntVector.fromArray(IntVector.SPECIES_256, src, 0);
        vec.lanewise(VectorOperators.ADD, vec)
           .intoArray(dst, 0);
    }
    public static void main(String[] args) throws Exception {
        int[] dst = new int[16];
        for(int i = 0; i < 100000; i++) {
            micro(src, dst);
        }
        System.out.println(Arrays.toString(dst));
    }
}

