
import jdk.incubator.vector.*;

public class bcast1 {
    public static float micro(int val) {
       return FloatVector.SPECIES_512.broadcast(val).reinterpretAsFloats().lane(0); 
    }
    public static void main(String [] args) {
        float res = 0;
        for(int i = 0; i < 100000; i++ ) {
           res += micro(i); 
        }
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 100000; i++ ) {
           res += micro(i); 
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Time] " + (t2-t1));
    }
}
