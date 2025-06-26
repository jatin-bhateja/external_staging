
import jdk.incubator.vector.*;

public class bcast {
    public static long micro() {
        var species = IntVector.SPECIES_PREFERRED;
        var sum = IntVector.zero(species);
        /*return sum.add(1).add(2).add(3).add(4).add(5).add(6).add(7).add(8)
                .add(9).add(10).add(11).add(12).add(13).add(14).add(15).add(16)
                .add(17).add(18).add(19).add(20).add(21).add(22).add(23).add(24)
                .add(25).add(26).add(27).add(28).add(29).add(30).add(31).add(32)
                .add(1).add(2).add(3).add(4).add(5).add(6).add(7).add(8)
                .add(9).add(10).add(11).add(12).add(13).add(14).add(15).add(16)
                .add(17).add(18).add(19).add(20).add(21).add(22).add(23).add(24)
                .add(25).add(26).add(27).add(28).add(29).add(30).add(31).add(32)
                .reinterpretAsLongs()
                .lane(0);*/
        return sum.lane(0);
    }
    public static void main(String [] args) {
        long res = 0;
        for(int i = 0; i < 100000; i++ ) {
           res += micro(); 
        }
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++ ) {
           res += micro(); 
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Time] " + (t2-t1));
    }
}
