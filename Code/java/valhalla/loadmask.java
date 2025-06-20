
import jdk.incubator.vector.*;
import java.util.Arrays;

public class loadmask {
   public static double micro() {
     VectorMask m = null;
     double [] arr = {15.0, 10.0, 5.0, 0.0};
     m = VectorMask.fromValues(DoubleVector.SPECIES_128, true, false);
     DoubleVector v = DoubleVector.fromArray(DoubleVector.SPECIES_128, arr, 0, m);
     return v.lane(0); //System.out.println(v.lane(0) + "   ,     " + v.lane(1));
   }
   public static void main(String [] args) {
     double res  = 0.0;
     for(int i = 0; i < 10000; i++) {
        res += micro();
     }
     System.out.println(res);
   }
}
